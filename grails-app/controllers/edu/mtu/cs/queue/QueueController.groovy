package edu.mtu.cs.queue

import javax.servlet.http.HttpServletResponse
import java.nio.file.Paths
import java.nio.file.Path
import java.nio.file.Files
import java.io.File

import edu.mtu.cs.canvas.CanvasService

import java.util.zip.ZipEntry
import java.util.zip.ZipOutputStream

//import edu.mtu.cs.lti.LtiService

import static edu.mtu.MtuConstants.LANGUAGES

import edu.ksu.canvas.model.assignment.Assignment
import edu.mtu.cs.lti.LtiSession

import static javax.servlet.http.HttpServletResponse.SC_UNAUTHORIZED
import static javax.servlet.http.HttpServletResponse.SC_UNAUTHORIZED

class QueueController {
//    LtiService ltiService
    CanvasService canvasService
    QueueQuestionService queueQuestionService
    QueueAnswerService queueAnswerService
    QueueFileService queueFileService

    /**
     * Signals an HTTP 401 Unauthorized error response status.
     * @param response
     * @param session
     * @param msg
     * @return false
     */
    private boolean enforceUnauthorized(HttpServletResponse response, session, String msg = "") {
        session.invalidate()
        response.status = SC_UNAUTHORIZED
        response.sendError(SC_UNAUTHORIZED, 'UnAuthorized: ' + msg)
        return false
    }

    def deleteQuestion() {
        LtiSession ltiSession = null;
        if (params.ticket != null) {
            ltiSession = LtiSession.findById(params.ticket)
        } else if (request.getAttribute("ticket") != null) {
            ltiSession = LtiSession.findById(request.getAttribute("ticket"))
        } else {
            enforceUnauthorized(response, session, "Ticket not found.")
            return false
        }

        List<Assignment> assignments = []

        QueueQuestion question = QueueQuestion.findById(params.question)
        question.isDeleted = true
        question.deletedBy = ltiSession.person
        queueQuestionService.save(question)

        List<QueueQuestion> openQuestions = []
        List<QueueQuestion> answeredQuestions = []
        List<QueueQuestion> relatedQuestions = []
        HashMap<QueueQuestion, List<QueueAnswer>> myQuestionsAndAnswers = [:]
        HashMap<QueueQuestion, List<QueueAnswer>> relatedQuestionsAndAnswers = [:]

        def view = "index"
        if (canvasService.isInstructor(ltiSession)) {
            view = "instructor"
            openQuestions = QueueQuestion.findAllByCourseAndIsAnsweredAndIsDeleted(ltiSession.courseId, false, false)
                    ?.sort { it.id }
                    ?.reverse()
            answeredQuestions = QueueQuestion.findAllByCourseAndIsAnsweredAndIsDeleted(ltiSession.courseId, true, false)
                    ?.sort { it.id }
                    ?.reverse()
            answeredQuestions.each { QueueQuestion q ->
                myQuestionsAndAnswers.put(q, QueueAnswer.findAllByQuestionAndIsDeleted(q, false)?.sort {
                    it.id
                }?.reverse())
            }
        } else if (canvasService.isTa(ltiSession)) {
            view = "gta"
            openQuestions = QueueQuestion.findAllByCourseAndIsAnsweredAndIsDeleted(ltiSession.courseId, false, false)
                    ?.sort { it.id }
                    ?.reverse()
            answeredQuestions = QueueQuestion.findAllByCourseAndIsAnsweredAndIsDeleted(ltiSession.courseId, true, false)
                    ?.sort { it.id }
                    ?.reverse()
            answeredQuestions.each { QueueQuestion q ->
                myQuestionsAndAnswers.put(q, QueueAnswer.findAllByQuestionAndIsDeleted(q, false)?.sort {
                    it.id
                }?.reverse())
            }
        } else if (canvasService.isCoach(ltiSession)) {
            view = "coach"
        } else if (canvasService.isStudent(ltiSession)) {
            view = "student"
            assignments = [ ]
//            assignments = canvasService.getUserAssignments(ltiSession, session)
//                    ?.sort { it.dueAt }
//                    ?.findAll { Assignment assignment -> assignment.published && assignment.dueAt >= new Date() }
            openQuestions = QueueQuestion.findAllByPersonAndIsAnsweredAndIsDeleted(ltiSession.person, false, false)
                    ?.sort { it.id }
                    ?.reverse()
            answeredQuestions = QueueQuestion.findAllByPersonAndIsAnsweredAndIsDeleted(ltiSession.person, true, false)
                    ?.sort { it.id }
                    ?.reverse()
            relatedQuestions = QueueQuestion.findAllByCourseAndIsDeleted(ltiSession.courseId, false)
                    ?.findAll { !it.person.equals(ltiSession.person) }
                    ?.sort { it.id }
                    ?.reverse()
            answeredQuestions.each {
                myQuestionsAndAnswers.put(it, QueueAnswer.findAllByQuestionAndIsDeleted(it, false)?.sort {
                    it.id
                }?.reverse())
            }
            relatedQuestions.each {
                relatedQuestionsAndAnswers.put(it, QueueAnswer.findAllByQuestionAndIsDeleted(it, false)?.sort {
                    it.id
                }?.reverse())
            }
        }

        render(view: view, model: [
                ltiSession                  : ltiSession
                , assignments               : assignments
                , openQuestions             : openQuestions
                , answeredQuestions         : answeredQuestions
                , myQuestionsAndAnswers     : myQuestionsAndAnswers
                , relatedQuestions          : relatedQuestions
                , relatedQuestionsAndAnswers: relatedQuestionsAndAnswers
                , languages: LANGUAGES
        ])
    }

    def deleteAnswer() {
        LtiSession ltiSession = null;
        if (params.ticket != null) {
            ltiSession = LtiSession.findById(params.ticket)
        } else if (request.getAttribute("ticket") != null) {
            ltiSession = LtiSession.findById(request.getAttribute("ticket"))
        } else {
            enforceUnauthorized(response, session, "Ticket not found.")
            return false
        }

        List<Assignment> assignments = []

        QueueAnswer answer = QueueAnswer.findById(params.answer)
        answer.isDeleted = true
        answer.deletedBy = ltiSession.person
        queueAnswerService.save(answer)

        if (QueueAnswer.findAllByQuestionAndIsDeleted(answer.question, false)?.isEmpty()) {
            answer.question.isAnswered = false
            queueQuestionService.save(answer.question)
        }

        List<QueueQuestion> openQuestions = []
        List<QueueQuestion> answeredQuestions = []
        List<QueueQuestion> relatedQuestions = []
        HashMap<QueueQuestion, List<QueueAnswer>> myQuestionsAndAnswers = [:]
        HashMap<QueueQuestion, List<QueueAnswer>> relatedQuestionsAndAnswers = [:]

        def view = "index"
        if (canvasService.isInstructor(ltiSession)) {
            view = "instructor"
            openQuestions = QueueQuestion.findAllByCourseAndIsAnsweredAndIsDeleted(ltiSession.courseId, false, false)
                    ?.sort { it.id }
                    ?.reverse()
            answeredQuestions = QueueQuestion.findAllByCourseAndIsAnsweredAndIsDeleted(ltiSession.courseId, true, false)
                    ?.sort { it.id }
                    ?.reverse()
            answeredQuestions.each { QueueQuestion q ->
                myQuestionsAndAnswers.put(q, QueueAnswer.findAllByQuestionAndIsDeleted(q, false)?.sort {
                    it.id
                }?.reverse())
            }
        } else if (canvasService.isTa(ltiSession)) {
            view = "gta"
            openQuestions = QueueQuestion.findAllByCourseAndIsAnsweredAndIsDeleted(ltiSession.courseId, false, false)
                    ?.sort { it.id }
                    ?.reverse()
            answeredQuestions = QueueQuestion.findAllByCourseAndIsAnsweredAndIsDeleted(ltiSession.courseId, true, false)
                    ?.sort { it.id }
                    ?.reverse()
            answeredQuestions.each { QueueQuestion q ->
                myQuestionsAndAnswers.put(q, QueueAnswer.findAllByQuestionAndIsDeleted(q, false)?.sort {
                    it.id
                }?.reverse())
            }
        } else if (canvasService.isCoach(ltiSession)) {
            view = "coach"
        } else if (canvasService.isStudent(ltiSession)) {
            view = "student"
            assignments = [ ]
//            assignments = canvasService.getUserAssignments(ltiSession, session)
//                    ?.sort { it.dueAt }
//                    ?.findAll { Assignment assignment -> assignment.published && assignment.dueAt >= new Date() }
            openQuestions = QueueQuestion.findAllByPersonAndIsAnsweredAndIsDeleted(ltiSession.person, false, false)
                    ?.sort { it.id }
                    ?.reverse()
            answeredQuestions = QueueQuestion.findAllByPersonAndIsAnsweredAndIsDeleted(ltiSession.person, true, false)
                    ?.sort { it.id }
                    ?.reverse()
            relatedQuestions = QueueQuestion.findAllByCourseAndIsDeleted(ltiSession.courseId, false)
                    ?.findAll { !it.person.equals(ltiSession.person) }
                    ?.sort { it.id }
                    ?.reverse()
            answeredQuestions.each {
                myQuestionsAndAnswers.put(it, QueueAnswer.findAllByQuestionAndIsDeleted(it, false)?.sort {
                    it.id
                }?.reverse())
            }
            relatedQuestions.each {
                relatedQuestionsAndAnswers.put(it, QueueAnswer.findAllByQuestionAndIsDeleted(it, false)?.sort {
                    it.id
                }?.reverse())
            }
        }

        render(view: view, model: [
                ltiSession                  : ltiSession
                , assignments               : assignments
                , openQuestions             : openQuestions
                , answeredQuestions         : answeredQuestions
                , myQuestionsAndAnswers     : myQuestionsAndAnswers
                , relatedQuestions          : relatedQuestions
                , relatedQuestionsAndAnswers: relatedQuestionsAndAnswers
                , languages: LANGUAGES
        ])
    }

    def createAnswer() {
        LtiSession ltiSession = null;
        if (params.ticket != null) {
            ltiSession = LtiSession.findById(params.ticket)
        } else if (request.getAttribute("ticket") != null) {
            ltiSession = LtiSession.findById(request.getAttribute("ticket"))
        } else {
            enforceUnauthorized(response, session, "Ticket not found.")
            return false
        }

        List<Assignment> assignments = []

        QueueQuestion question = QueueQuestion.findById(params.question)
        question.isAnswered = true
        queueQuestionService.save(question)

        QueueAnswer answer = new QueueAnswer(
                person: ltiSession.person
                , question: question
                , answerText: params.answer
                , isAccepted: false
                , isDeleted: false
                , deletedBy: null
                , ipaddress: request.getRemoteAddr()
                , hostname: InetAddress.getByName(request.getRemoteAddr()).getHostName()
                , emailSent: false
        )


        if (params.notify != null) {
            canvasService.createConversation(ltiSession, session, question.person.canvasID, "${'[Queue:' + question.id + '] Re: ' + question.subject}", "Regarding your question: " + question.subject + "\n\nYou asked:\n\n" + question.message + "\n\nHere is my answer:\n\n" + answer.answerText + "\n\nI hope this helps.\n\n" + answer.person.fullName)
            answer.emailSent = true;
        }

        queueAnswerService.save(answer)

        List<QueueQuestion> openQuestions = []
        List<QueueQuestion> answeredQuestions = []
        List<QueueQuestion> relatedQuestions = []
        HashMap<QueueQuestion, List<QueueAnswer>> myQuestionsAndAnswers = [:]
        HashMap<QueueQuestion, List<QueueAnswer>> relatedQuestionsAndAnswers = [:]

        def view = "index"
        if (canvasService.isInstructor(ltiSession)) {
            view = "instructor"
            openQuestions = QueueQuestion.findAllByCourseAndIsAnsweredAndIsDeleted(ltiSession.courseId, false, false)
                    ?.sort { it.id }
                    ?.reverse()
            answeredQuestions = QueueQuestion.findAllByCourseAndIsAnsweredAndIsDeleted(ltiSession.courseId, true, false)
                    ?.sort { it.id }
                    ?.reverse()
            answeredQuestions.each { QueueQuestion q ->
                myQuestionsAndAnswers.put(q, QueueAnswer.findAllByQuestionAndIsDeleted(q, false)?.sort {
                    it.id
                }?.reverse())
            }
        } else if (canvasService.isTa(ltiSession)) {
            view = "gta"
            openQuestions = QueueQuestion.findAllByCourseAndIsAnsweredAndIsDeleted(ltiSession.courseId, false, false)
                    ?.sort { it.id }
                    ?.reverse()
            answeredQuestions = QueueQuestion.findAllByCourseAndIsAnsweredAndIsDeleted(ltiSession.courseId, true, false)
                    ?.sort { it.id }
                    ?.reverse()
            answeredQuestions.each { QueueQuestion q ->
                myQuestionsAndAnswers.put(q, QueueAnswer.findAllByQuestionAndIsDeleted(q, false)?.sort {
                    it.id
                }?.reverse())
            }
        } else if (canvasService.isCoach(ltiSession)) {
            view = "coach"
        } else if (canvasService.isStudent(ltiSession)) {
            view = "student"
            assignments = [ ]
//            assignments = canvasService.getUserAssignments(ltiSession, session)
//                    ?.sort { it.dueAt }
//                    ?.findAll { Assignment assignment -> assignment.published && assignment.dueAt >= new Date() }
            openQuestions = QueueQuestion.findAllByPersonAndIsAnsweredAndIsDeleted(ltiSession.person, false, false)
                    ?.sort { it.id }
                    ?.reverse()
            answeredQuestions = QueueQuestion.findAllByPersonAndIsAnsweredAndIsDeleted(ltiSession.person, true, false)
                    ?.sort { it.id }
                    ?.reverse()
            relatedQuestions = QueueQuestion.findAllByCourseAndIsDeleted(ltiSession.courseId, false)
                    ?.findAll { !it.person.equals(ltiSession.person) }
                    ?.sort { it.id }
                    ?.reverse()
            answeredQuestions.each {
                myQuestionsAndAnswers.put(it, QueueAnswer.findAllByQuestionAndIsDeleted(it, false)?.sort {
                    it.id
                }?.reverse())
            }
            relatedQuestions.each {
                relatedQuestionsAndAnswers.put(it, QueueAnswer.findAllByQuestionAndIsDeleted(it, false)?.sort {
                    it.id
                }?.reverse())
            }
        }

        render(view: view, model: [
                ltiSession                  : ltiSession
                , assignments               : assignments
                , openQuestions             : openQuestions
                , answeredQuestions         : answeredQuestions
                , myQuestionsAndAnswers     : myQuestionsAndAnswers
                , relatedQuestions          : relatedQuestions
                , relatedQuestionsAndAnswers: relatedQuestionsAndAnswers
                , languages: LANGUAGES
        ])
    }

    def createQuestion() {
        LtiSession ltiSession = null
        if (params.ticket != null) {
            ltiSession = LtiSession.findById(params.ticket)
        } else if (request.getAttribute("ticket") != null) {
            ltiSession = LtiSession.findById(request.getAttribute("ticket"))
        } else {
            enforceUnauthorized(response, session, "Ticket not found.")
            return false
        }

        def courses = LtiSession.findAllByLtiToken(ltiSession.ltiToken).forEach({ e -> e.context_title })





        //Use question.addToFiles() when QueueQuestion is defined to add

       List<Assignment> assignments = [ ]
//        List<Assignment> assignments = canvasService.getUserAssignments(ltiSession, session)
//                ?.sort { it.dueAt }
//                ?.findAll { Assignment assignment -> assignment.published && assignment.dueAt >= new Date() }
        String subject = params.subject
        String message = params.question != null ? params.question : subject
        if (message == null || message.isEmpty()) {
            subject="No Subject Provided"
            message="No Message Provided"
        }
        if (subject==null || subject.isEmpty()) {
            Scanner scanner = new Scanner(message)
            subject = scanner.nextLine()
            if (subject.length() > 32) {
                subject = subject.substring(0,32) + "..."
            }
        }
        QueueQuestion question = new QueueQuestion(
                person: ltiSession.person
                , course: ltiSession.courseId
                , courseName: ltiSession.context_title
                , assignment: "7543844" // params['assignment']
                , assignmentName: "Week 3 Program : Hash Table" // assignments.find { it.id.equals(params['assignment']) }?.name
                , language: params['language']
                , ipaddress: request.getRemoteAddr()
                , hostname: InetAddress.getByName(request.getRemoteAddr()).getHostName()
                , isHandRaised: params.attention != null
                , isAnswered: false
                , isDeleted: false
                , deletedBy: null
                , subject: subject
                , message: message
        )
        queueQuestionService.save(question)

        //Check if the student uploaded any files
        if(request.getFiles('file').size() > 1) {
            File tempFolder = new File("/tmp/" + ltiSession.ltiToken + ":" + new Date())
            Files.createDirectory(tempFolder.toPath())

            //Create all of the files in the /tmp directory
            for (def f in request.getFiles('file')) {
                String filename = f.getOriginalFilename()
                File temp = new File(tempFolder.getPath() + "/" + filename)
                f.transferTo(temp)
            }

            //Zip up the files that the student uploaded
            ZipOutputStream zipFile = new ZipOutputStream(new FileOutputStream(tempFolder.getPath()+".zip"))
            new File(tempFolder.getPath()).eachFile {file ->
                if(file.isFile()) {
                    zipFile.putNextEntry(new ZipEntry(file.name))
                    def buffer = new byte[file.size()]
                    file.withInputStream {it ->
                        zipFile.write(buffer, 0, it.read(buffer))
                    }
                    zipFile.closeEntry()
                }
            }
            zipFile.close()

            String path = tempFolder.getPath()+".zip"
            byte[] bytes = Files.readAllBytes(Paths.get(path))
            String filename = path.split('/')[-1]
            QueueFile files = new QueueFile(
                    question: question,
                    fileData: bytes,
                    fileMimeType: "zip",
                    fileName: filename,
                    answer: null
            )
            //TODO Add the creation of the QueueFile and add it to the QueueQuestion files hasMany array
            queueFileService.save(files)
            question.addToFiles(files)
        }

        List<QueueQuestion> openQuestions = []
        List<QueueQuestion> answeredQuestions = []
        List<QueueQuestion> relatedQuestions = []
        HashMap<QueueQuestion, List<QueueAnswer>> myQuestionsAndAnswers = [:]
        HashMap<QueueQuestion, List<QueueAnswer>> relatedQuestionsAndAnswers = [:]

        def view = "index"
        if (canvasService.isInstructor(ltiSession)) {
            view = "instructor"
            openQuestions = QueueQuestion.findAllByCourseAndIsAnsweredAndIsDeleted(ltiSession.courseId, false, false)
                    ?.sort { it.id }
                    ?.reverse()
            answeredQuestions = QueueQuestion.findAllByCourseAndIsAnsweredAndIsDeleted(ltiSession.courseId, true, false)
                    ?.sort { it.id }
                    ?.reverse()
            answeredQuestions.each { QueueQuestion q ->
                myQuestionsAndAnswers.put(q, QueueAnswer.findAllByQuestionAndIsDeleted(q, false)?.sort {
                    it.id
                }?.reverse())
            }
        } else if (canvasService.isTa(ltiSession)) {
            view = "gta"
            openQuestions = QueueQuestion.findAllByCourseAndIsAnsweredAndIsDeleted(ltiSession.courseId, false, false)
                    ?.sort { it.id }
                    ?.reverse()
            answeredQuestions = QueueQuestion.findAllByCourseAndIsAnsweredAndIsDeleted(ltiSession.courseId, true, false)
                    ?.sort { it.id }
                    ?.reverse()
            answeredQuestions.each { QueueQuestion q ->
                myQuestionsAndAnswers.put(q, QueueAnswer.findAllByQuestionAndIsDeleted(q, false)?.sort {
                    it.id
                }?.reverse())
            }
        } else if (canvasService.isCoach(ltiSession)) {
            view = "coach"
        } else if (canvasService.isStudent(ltiSession)) {
            view = "student"
            openQuestions = QueueQuestion.findAllByPersonAndIsAnsweredAndIsDeleted(ltiSession.person, false, false)
                    ?.sort { it.id }
                    ?.reverse()
            answeredQuestions = QueueQuestion.findAllByPersonAndIsAnsweredAndIsDeleted(ltiSession.person, true, false)
                    ?.sort { it.id }
                    ?.reverse()
            relatedQuestions = QueueQuestion.findAllByCourseAndIsDeleted(ltiSession.courseId, false)
                    ?.findAll { !it.person.equals(ltiSession.person) }
                    ?.sort { it.id }
                    ?.reverse()
            answeredQuestions.each {
                myQuestionsAndAnswers.put(it, QueueAnswer.findAllByQuestionAndIsDeleted(it, false)?.sort {
                    it.id
                }?.reverse())
            }
            relatedQuestions.each {
                relatedQuestionsAndAnswers.put(it, QueueAnswer.findAllByQuestionAndIsDeleted(it, false)?.sort {
                    it.id
                }?.reverse())
            }
        }

        render(view: view, model: [
                ltiSession                  : ltiSession
                , assignments               : assignments
                , openQuestions             : openQuestions
                , answeredQuestions         : answeredQuestions
                , myQuestionsAndAnswers     : myQuestionsAndAnswers
                , relatedQuestions          : relatedQuestions
                , relatedQuestionsAndAnswers: relatedQuestionsAndAnswers
                , languages: LANGUAGES
        ])
    }

    def index() {
        LtiSession ltiSession = null;
        if (params.ticket != null) {
            ltiSession = LtiSession.findById(params.ticket)
        } else if (request.getAttribute("ticket") != null) {
            ltiSession = LtiSession.findById(request.getAttribute("ticket"))
        } else {
            enforceUnauthorized(response, session, "Ticket not found.")
            return false
        }

        List<Assignment> assignments = []

        List<QueueQuestion> openQuestions = []
        List<QueueQuestion> answeredQuestions = []
        List<QueueQuestion> relatedQuestions = []
        HashMap<QueueQuestion, List<QueueAnswer>> myQuestionsAndAnswers = [:]
        HashMap<QueueQuestion, List<QueueAnswer>> relatedQuestionsAndAnswers = [:]

        def view = "index"
        if (canvasService.isInstructor(ltiSession)) {
            view = "instructor"
            openQuestions = QueueQuestion.findAllByCourseAndIsAnsweredAndIsDeleted(ltiSession.courseId, false, false)
                    ?.sort { it.id }
                    ?.reverse()
            answeredQuestions = QueueQuestion.findAllByCourseAndIsAnsweredAndIsDeleted(ltiSession.courseId, true, false)
                    ?.sort { it.id }
                    ?.reverse()
            answeredQuestions.each { QueueQuestion q ->
                myQuestionsAndAnswers.put(q, QueueAnswer.findAllByQuestionAndIsDeleted(q, false)?.sort {
                    it.id
                }?.reverse())
            }
        } else if (canvasService.isTa(ltiSession)) {
            view = "gta"
            openQuestions = QueueQuestion.findAllByCourseAndIsAnsweredAndIsDeleted(ltiSession.courseId, false, false)
                    ?.sort { it.id }
                    ?.reverse()
            answeredQuestions = QueueQuestion.findAllByCourseAndIsAnsweredAndIsDeleted(ltiSession.courseId, true, false)
                    ?.sort { it.id }
                    ?.reverse()
            answeredQuestions.each { QueueQuestion q ->
                myQuestionsAndAnswers.put(q, QueueAnswer.findAllByQuestionAndIsDeleted(q, false)?.sort {
                    it.id
                }?.reverse())
            }
        } else if (canvasService.isCoach(ltiSession)) {
            view = "coach"
            if (ltiSession.custom_canvas_course_id != 1265465) {
                openQuestions = QueueQuestion.findAllByCourseAndIsAnsweredAndIsDeleted(ltiSession.courseId, false, false)
                        ?.sort { it.id }
                        ?.reverse()
                answeredQuestions = QueueQuestion.findAllByCourseAndIsAnsweredAndIsDeleted(ltiSession.courseId, true, false)
                        ?.sort { it.id }
                        ?.reverse()
                answeredQuestions.each { QueueQuestion q ->
                    myQuestionsAndAnswers.put(q, QueueAnswer.findAllByQuestionAndIsDeleted(q, false)?.sort {
                        it.id
                    }?.reverse())
                }
            } else {
                openQuestions = QueueQuestion.findAllByIsAnsweredAndIsDeleted(false, false)
                        ?.sort { it.id }
                        ?.reverse()
                answeredQuestions = QueueQuestion.findAllByIsAnsweredAndIsDeleted(true, false)
                        ?.sort { it.id }
                        ?.reverse()
                answeredQuestions.each { QueueQuestion q ->
                    myQuestionsAndAnswers.put(q, QueueAnswer.findAllByQuestionAndIsDeleted(q, false)?.sort {
                        it.id
                    }?.reverse())
                }
            }
        } else if (canvasService.isStudent(ltiSession)) {
            view = "student"
            assignments = [ ]
//            assignments = canvasService.getUserAssignments(ltiSession, session)
//                    ?.sort { it.dueAt }
//                    ?.findAll { Assignment assignment -> assignment.published && assignment.dueAt >= new Date() }
            openQuestions = QueueQuestion.findAllByPersonAndIsAnsweredAndIsDeleted(ltiSession.person, false, false)
                    ?.sort { it.id }
                    ?.reverse()
            answeredQuestions = QueueQuestion.findAllByPersonAndIsAnsweredAndIsDeleted(ltiSession.person, true, false)
                    ?.sort { it.id }
                    ?.reverse()
            relatedQuestions = QueueQuestion.findAllByCourseAndIsDeleted(ltiSession.courseId, false)
                    ?.findAll { !it.person.equals(ltiSession.person) }
                    ?.sort { it.id }
                    ?.reverse()
            answeredQuestions.each {
                myQuestionsAndAnswers.put(it, QueueAnswer.findAllByQuestionAndIsDeleted(it, false)?.sort {
                    it.id
                }?.reverse())
            }
            relatedQuestions.each {
                relatedQuestionsAndAnswers.put(it, QueueAnswer.findAllByQuestionAndIsDeleted(it, false)?.sort {
                    it.id
                }?.reverse())
            }
        }

        render(view: view, model: [
                ltiSession                  : ltiSession
                , assignments               : assignments
                , openQuestions             : openQuestions
                , answeredQuestions         : answeredQuestions
                , myQuestionsAndAnswers     : myQuestionsAndAnswers
                , relatedQuestions          : relatedQuestions
                , relatedQuestionsAndAnswers: relatedQuestionsAndAnswers
                , languages: LANGUAGES
        ])
    }
}
