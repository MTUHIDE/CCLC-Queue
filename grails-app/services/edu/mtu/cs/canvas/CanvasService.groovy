package edu.mtu.cs.canvas

import com.google.gson.Gson
import com.google.gson.JsonObject

// TODO: The CanvasService is still in rapid development with changes occurring daily. Send changes to Leo.

import edu.ksu.canvas.CanvasApiFactory
import edu.ksu.canvas.interfaces.AssignmentGroupReader
import edu.ksu.canvas.interfaces.AssignmentReader
import edu.ksu.canvas.interfaces.ConversationWriter
import edu.ksu.canvas.interfaces.CourseReader
import edu.ksu.canvas.interfaces.EnrollmentReader
import edu.ksu.canvas.interfaces.SubmissionReader
import edu.ksu.canvas.interfaces.UserProfileReader
import edu.ksu.canvas.interfaces.UserReader
import edu.ksu.canvas.model.Conversation
import edu.ksu.canvas.model.Course
import edu.ksu.canvas.model.Enrollment
import edu.ksu.canvas.model.User
import edu.ksu.canvas.model.UserProfile
import edu.ksu.canvas.model.assignment.Assignment
import edu.ksu.canvas.model.assignment.AssignmentGroup
import edu.ksu.canvas.model.assignment.Submission
import edu.ksu.canvas.oauth.OauthToken
import edu.ksu.canvas.requestOptions.CreateConversationOptions
import edu.ksu.canvas.requestOptions.GetEnrollmentOptions
import edu.ksu.canvas.requestOptions.GetSingleCourseOptions
import edu.ksu.canvas.requestOptions.ListAssignmentGroupOptions
import edu.ksu.canvas.requestOptions.ListCourseAssignmentsOptions
import edu.ksu.canvas.requestOptions.ListMultipleSubmissionsOptions
import edu.ksu.canvas.requestOptions.ListUserAssignmentOptions

//import edu.ksu.canvas.requestOptions.MultipleSubmissionsOptions
import edu.mtu.cs.lti.LtiSession
//import edu.mtu.cs.lti.Person
import grails.gorm.transactions.Transactional

import javax.servlet.http.HttpSession

@Transactional
class CanvasService {
    def LtiService

    /**
     * @param session
     * @return the base Canvas URL (e.g. https://mtu.instructure.com)
     */
    def getCanvasBaseUrl( LtiSession ltiSession ) {
        // could use launch_presentation_return_url, but I think custom_canvas_api_domain is intended for this.
        String launchReturnUrl = ltiSession.custom_canvas_api_domain
        return "https://" + launchReturnUrl
    }

    /**
     * @param score
     * @param maxScore
     * @return Letter Grade corresponding to score
     */
    @Transactional( readOnly = true )
    def calculateLetterGrade( score, maxScore ) {
        // TODO: Hardcoded. Should download and use grading scale from Canvas. Set by Instructor.
        def percentScore = score / maxScore
        def letterGrade = "?"
        if (percentScore >= 0.92 ) {
            letterGrade = "A"
        } else if ( percentScore >= 0.88 ) {
            letterGrade = "AB"
        } else if ( percentScore >= 0.80 ) {
            letterGrade = "B"
        } else if ( percentScore >= 0.78 ) {
            letterGrade = "BC"
        } else if ( percentScore >= 0.70 ) {
            letterGrade = "C"
        } else if ( percentScore >= 0.68 ) {
            letterGrade = "CD"
        } else if ( percentScore >= 0.60 ) {
            letterGrade = "D"
        } else if ( percentScore >= 0.0 ) {
            letterGrade = "F"
        }
        return letterGrade
    }

    /**
     * @param session
     * @return true if user is an Instructor in the current course
     */
    boolean isInstructor( LtiSession ltiSession ) {
        return ltiSession?.roles?.toUpperCase()?.contains('INSTRUCTOR')
    }

    /**
     * @param session
     * @return true if user is an Student in the current course
     */
    boolean isStudent( LtiSession ltiSession ) {
        return ltiSession?.roles?.toUpperCase()?.contains('LEARNER')
    }

    /**
     * @param session
     * @return true if user is an TA in the current course
     */
    boolean isTa( LtiSession ltiSession ) {
        return ltiSession?.roles?.toUpperCase()?.contains('TEACHINGASSISTANT')
    }

    /**
     * @param session
     * @return true if user is an Coach in the current course
     */
    boolean isCoach( LtiSession ltiSession ) {
        return ltiSession?.custom_mtu_canvas_role?.toUpperCase()?.contains('LEARNING CENTER COACH')
    }

    /**
     * @param session
     * @return The current user's enrollment for the current course
     */
    def getCourseEnrollment( LtiSession ltiSession, HttpSession session  ) {
        OauthToken oauthToken = LtiService.getToken( ltiSession, session )

        CanvasApiFactory apiFactory = new CanvasApiFactory( getCanvasBaseUrl( ltiSession ) )
        EnrollmentReader enrollementReader = apiFactory.getReader(EnrollmentReader.class, oauthToken)
        GetEnrollmentOptions options =
                new GetEnrollmentOptions(ltiSession.custom_canvas_user_id as String) //required user ID
                        .type(Arrays.asList(GetEnrollmentOptions.EnrollmentType.STUDENT))
        List<Enrollment> enrollments = enrollementReader.getUserEnrollments(options)
        Enrollment enrollment = null
        for( Enrollment it : enrollments ) {
            if (ltiSession.custom_canvas_course_id?.equals(""+it.getCourseId())) {
                enrollment = it
                break
            }
        }
        return enrollment
    }

    def getUser( HttpSession session, String canvasID, String refreshToken, String accessToken, LtiSession ltiSession  ) {
        OauthToken oauthToken = LtiService.createOAuthToken( session, refreshToken, accessToken, ltiSession )

        CanvasApiFactory apiFactory = new CanvasApiFactory( "https://" + "mtu.instructure.com" )
        UserReader userReader = apiFactory.getReader(UserReader.class, oauthToken)
        Optional<User> result = userReader.showUserDetails(canvasID)
        User user = null
        if ( result.isPresent() ) {
            user = result.get()
        }
        return user
    }

    def getUserProfile( HttpSession session, String canvasID, String refreshToken, String accessToken, LtiSession ltiSession  ) {
        OauthToken oauthToken = LtiService.createOAuthToken( session, refreshToken, accessToken, ltiSession )

        CanvasApiFactory apiFactory = new CanvasApiFactory( "https://" + "mtu.instructure.com" )
        UserProfileReader userProfileReader = apiFactory.getReader(UserProfileReader.class, oauthToken)
        Optional<UserProfile> result = userProfileReader.showUserProfileDetails(canvasID)
        UserProfile userProfile = null
        if ( result.isPresent() ) {
            userProfile = result.get()
        }
        return userProfile
    }

    def getCourse( LtiSession ltiSession, HttpSession session  ) {
        OauthToken oauthToken = LtiService.getToken( ltiSession, session )

        CanvasApiFactory apiFactory = new CanvasApiFactory( getCanvasBaseUrl( ltiSession ) )
        CourseReader courseReader = apiFactory.getReader(CourseReader.class, oauthToken)
        GetSingleCourseOptions options =
                new GetSingleCourseOptions(ltiSession.custom_canvas_course_id as String) //required course ID
                        .includes(Arrays.asList(GetSingleCourseOptions.Include.FAVORITES))
        Optional<Course> result = courseReader.getSingleCourse(options)
        Course course = null
        if ( result.isPresent() ) {
            course = result.get()
        }
        return course
    }

    def createConversation( LtiSession ltiSession, HttpSession session, String recipient, String subject, String bodyText  ) {
        OauthToken oauthToken = LtiService.getToken( ltiSession, session )

        CanvasApiFactory apiFactory = new CanvasApiFactory( getCanvasBaseUrl( ltiSession ) )
        ConversationWriter conversationWriter = apiFactory.getWriter(ConversationWriter.class, oauthToken)
        CreateConversationOptions options =
                new CreateConversationOptions(recipient, bodyText) //required recipient ID
        options.subject( subject )
        List<Conversation> conversation = conversationWriter.createConversation(options)
        return conversation
    }

    def getAssignmentGroups( LtiSession ltiSession, HttpSession session  ) {
        OauthToken oauthToken = LtiService.getToken( ltiSession, session )

        CanvasApiFactory apiFactory = new CanvasApiFactory( getCanvasBaseUrl( ltiSession ) )
        AssignmentGroupReader assignmentGroupReader = apiFactory.getReader(AssignmentGroupReader.class, oauthToken)
        ListAssignmentGroupOptions options =
                new ListAssignmentGroupOptions(ltiSession.custom_canvas_course_id as String) //required course ID
        List<AssignmentGroup> assignmentGroups = assignmentGroupReader.listAssignmentGroup(options)
        return assignmentGroups
    }

    def getCourseAssignments( LtiSession ltiSession, HttpSession session  ) {
        OauthToken oauthToken = LtiService.getToken( ltiSession, session )

        CanvasApiFactory apiFactory = new CanvasApiFactory( getCanvasBaseUrl( ltiSession ) )
        AssignmentReader assignmentReader = apiFactory.getReader(AssignmentReader.class, oauthToken)
        ListCourseAssignmentsOptions options =
                new ListCourseAssignmentsOptions(ltiSession.custom_canvas_course_id as String) //required course ID
                        .includes(Arrays.asList(ListCourseAssignmentsOptions.Include.SUBMISSION))
        List<Assignment> assignments = assignmentReader.listCourseAssignments(options)
        return assignments
    }

    def getUserAssignments(LtiSession ltiSession, HttpSession session ) {
        OauthToken oauthToken = LtiService.getToken( ltiSession, session )

        CanvasApiFactory apiFactory = new CanvasApiFactory( getCanvasBaseUrl( ltiSession ) )
        AssignmentReader assignmentReader = apiFactory.getReader(AssignmentReader.class, oauthToken)
        ListUserAssignmentOptions options =
                new ListUserAssignmentOptions(ltiSession.custom_canvas_course_id as String, ltiSession.custom_canvas_user_id as String) //required course ID
                        .includes(Arrays.asList(ListCourseAssignmentsOptions.Include.SUBMISSION))
        List<Assignment> assignments = assignmentReader.listUserAssignments(options)
        return assignments
    }

    def getCourseSubmissions( LtiSession ltiSession, HttpSession session  ) {
        OauthToken oauthToken = LtiService.getToken( ltiSession, session )

        CanvasApiFactory apiFactory = new CanvasApiFactory( getCanvasBaseUrl( ltiSession ) )
        SubmissionReader submissionReader = apiFactory.getReader(SubmissionReader.class, oauthToken)
        ListMultipleSubmissionsOptions options =
                new ListMultipleSubmissionsOptions(ltiSession.custom_canvas_course_id as String) //required course ID
//                        .includes(Arrays.asList(ListCourseAssignmentsOptions.Include.SUBMISSION))
        List<Submission> submissions = submissionReader.listMultipleSubmissions(options)
        return submissions
    }

    JsonObject CanvasApiDirectGetUserProfile(String accessToken) {
        URL tokenUrl = new URL("https://mtu.instructure.com" + "/api/v1/users/self/profile" + "?access_token=" + accessToken)
        HttpURLConnection con = (HttpURLConnection) tokenUrl.openConnection()
        con.setRequestMethod("GET")
        con.setDoInput(true)
        con.setDoOutput(false)
        con.connect()
        int responseCode = con.getResponseCode();

        BufferedReader brin = new BufferedReader(new InputStreamReader(con.getInputStream()))
        String inputLine;
        StringBuffer content = new StringBuffer();
        while ((inputLine = brin.readLine()) != null) {
            content.append(inputLine);
        }
        return new Gson().fromJson(content.toString(), JsonObject.class)
    }

}