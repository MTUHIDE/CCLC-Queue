package edu.mtu.cs.lti

class LtiSession {

    Person person

    String applicationName
    String controllerName
    String actionName

    String courseId
    String assignmentId

    String ltiToken
    Boolean ltiTokenRequired                      // params['custom_mtu_lti_token_required']
    String ltiAccessToken
    String ltiRefreshableToken
    String ltiTokenRequestState
    String ltiVersion

    String custom_mtu_application_name            // Same as applicationName
    String custom_mtu_client_id                   // LTI Application / Developer Key
    String custom_mtu_controller_name             // Same as controllerName
    String custom_mtu_page_name                   // Same as actionName
    String custom_mtu_canvas_role                 // Canvas substitution variable $Canvas.membership.roles
    Boolean custom_mtu_lti_token_required          // true if app requires a custom token - requires a developer key to obtain

    String context_id                              // params['context_id']
    String context_label                           // params['context_label']
    String context_title                           // params['context_title']
    String custom_canvas_api_domain                // params['custom_canvas_api_domain']
    String custom_canvas_assignment_id             // params['custom_canvas_assignment_id']
    String custom_canvas_assignment_points_possible// params['custom_canvas_assignment_points_possible']
    String custom_canvas_assignment_title          // params['custom_canvas_assignment_title']
    String custom_canvas_course_id                 // params['custom_canvas_course_id']
    String custom_canvas_enrollment_state          // params['custom_canvas_enrollment_state']
    String custom_canvas_user_id                   // params['custom_canvas_user_id']
    String custom_canvas_user_login_id             // params['custom_canvas_user_login_id']
    String custom_canvas_workflow_state            // params['custom_canvas_workflow_state']
    String ext_ims_lis_basic_outcome_url           // params['ext_ims_lis_basic_outcome_url']
    String ext_lti_assignment_id                   // params['ext_lti_assignment_id']
    String ext_outcome_data_values_accepted        // params['ext_outcome_data_values_accepted']
    String ext_outcome_result_total_score_accepted // params['ext_outcome_result_total_score_accepted']
    String ext_outcome_submission_submitted_at_accepted // params['ext_outcome_submission_submitted_at_accepted']
    String ext_outcomes_tool_placement_url         // params['ext_outcomes_tool_placement_url']
    String ext_roles                               // params['ext_roles']
    String launch_presentation_document_target     // params['launch_presentation_document_target']
    String launch_presentation_locale              // params['launch_presentation_locale']
    String launch_presentation_return_url          // params['launch_presentation_return_url']
    String launch_presentation_height
    String launch_presentation_width
    String lis_outcome_service_url                 // params['lis_outcome_service_url']
    String lis_person_contact_email_primary        // params['lis_person_contact_email_primary']
    String lis_person_name_family                  // params['lis_person_name_family']
    String lis_person_name_full                    // params['lis_person_name_full']
    String lis_person_name_given                   // params['lis_person_name_given']
    String lis_person_sourcedid                    // params['lis_person_sourcedid']
    String lti_message_type                        // params['lti_message_type']
    String lis_result_sourcedid                    // params['lis_result_sourcedid']
    String resource_link_id                        // params['resource_link_id']
    String resource_link_title                     // params['resource_link_title']
    String roles                                   // params['roles']
    String tool_consumer_info_product_family_code  // params['tool_consumer_info_product_family_code']
    String tool_consumer_info_version              // params['tool_consumer_info_version']
    String tool_consumer_instance_contact_email    // params['tool_consumer_instance_contact_email']
    String tool_consumer_instance_guid             // params['tool_consumer_instance_guid']
    String tool_consumer_instance_name             // params['tool_consumer_instance_name']
    String user_id                                 // params['user_id']
    String user_image                              // params['user_image']

    Map params = [:]

    Date expirationDate
    Date dateCreated
    Date lastUpdated

    static mapping = {
        custom_canvas_enrollment_state type: 'text'
        custom_canvas_workflow_state type: 'text'
        ext_ims_lis_basic_outcome_url type: 'text'
        ext_outcome_data_values_accepted type: 'text'
        ext_outcomes_tool_placement_url type: 'text'
        launch_presentation_document_target type: 'text'
        launch_presentation_locale type: 'text'
        launch_presentation_return_url type: 'text'
        lis_outcome_service_url type: 'text'
        tool_consumer_instance_guid type: 'text'
        user_image type: 'text'

    }

    static constraints = {
        applicationName(nullable: true)
        controllerName(nullable: true)
        actionName(nullable: true)

        courseId(nullable: true)
        assignmentId(nullable: true)

        ltiToken(nullable: true)
        ltiTokenRequired(nullable:true)
        ltiAccessToken(nullable: true)
        ltiRefreshableToken(nullable: true)
        ltiTokenRequestState(nullable: true)
        ltiVersion(nullable: true)

        custom_mtu_application_name(nullable: true)
        custom_mtu_canvas_role(nullable: true)
        custom_mtu_client_id(nullable: true)
        custom_mtu_controller_name(nullable: true)
        custom_mtu_page_name(nullable: true)
        custom_mtu_lti_token_required(nullable: true)

        context_id(nullable: true)
        context_label(nullable: true)
        context_title(nullable: true)
        custom_canvas_api_domain(nullable: true)
        custom_canvas_assignment_id(nullable: true)
        custom_canvas_assignment_points_possible(nullable: true)
        custom_canvas_assignment_title(nullable: true)
        custom_canvas_course_id(nullable: true)
        custom_canvas_enrollment_state(nullable: true)
        custom_canvas_user_id(nullable: true)
        custom_canvas_user_login_id(nullable: true)
        custom_canvas_workflow_state(nullable: true)
        ext_ims_lis_basic_outcome_url(nullable: true)
        ext_lti_assignment_id(nullable: true)
        ext_outcome_data_values_accepted(nullable: true)
        ext_outcome_result_total_score_accepted(nullable: true)
        ext_outcome_submission_submitted_at_accepted(nullable: true)
        ext_outcomes_tool_placement_url(nullable: true)
        ext_roles(nullable: true)
        launch_presentation_document_target(nullable: true)
        launch_presentation_locale(nullable: true)
        launch_presentation_return_url(nullable: true)
        launch_presentation_height(nullable: true)
        launch_presentation_width(nullable: true)
        lis_outcome_service_url(nullable: true)
        lis_person_contact_email_primary(nullable: true)
        lis_person_name_family(nullable: true)
        lis_person_name_full(nullable: true)
        lis_person_name_given(nullable: true)
        lis_person_sourcedid(nullable: true)
        lis_result_sourcedid(nullable: true)
        lti_message_type(nullable: true)
        resource_link_id(nullable: true)
        resource_link_title(nullable: true)
        roles(nullable: true)
        tool_consumer_info_product_family_code(nullable: true)
        tool_consumer_info_version(nullable: true)
        tool_consumer_instance_contact_email(nullable: true)
        tool_consumer_instance_guid(nullable: true)
        tool_consumer_instance_name(nullable: true)
        user_id(nullable: true)
        user_image(nullable: true)

        expirationDate( defaultValue: calcExpirationDate( ) )
    }

    static Date calcExpirationDate( ) {
        new Date( ( new Date( ).getTime( ) ) +  30 * 60000)
    }

    boolean isExpired( ) {
        (new Date() ).compareTo( expirationDate ) > 0
    }

    def updateExpiration( ) {
        expirationDate = calcExpirationDate()
    }

    def forceExpire( ) {
        expirationDate = new Date()
    }

    String getData( String key ) {
        params?.get( key )
    }

    def putData( String key, String data ) {
        if (params == null) {
            params = [:]
        }
        if ( key.length() > 255 ) {
            log.info "LTI param key > 255 chars (${key})"
            key = key.substring(0, 255)
        }
        if ( data?.length() > 255 ) {
            log.info "LTI param data > 255 chars (${key}:${data})"
            data = data.substring(0, 255)
        }
        params.put(key , data)
    }

    /**
     * @return true if user is an Instructor in the current course
     */
    boolean isInstructor( ) {
        roles?.toUpperCase()?.contains('INSTRUCTOR')
    }

    /**
     * @return true if user is an Student in the current course
     */
    boolean isStudent( ) {
        roles?.toUpperCase()?.contains('LEARNER')
    }

    /**
     * @return true if user is an TA in the current course
     */
    boolean isTa( ) {
        roles?.toUpperCase()?.contains('TEACHINGASSISTANT')
    }

    /**
     * @return true if user is an Coach in the current course
     */
    boolean isCoach( ) {
        custom_mtu_canvas_role?.toUpperCase()?.contains('LEARNING CENTER COACH')
    }

    /**
     * @return the base Canvas URL (e.g. https://mtu.instructure.com)
     */
    public String getCanvasBaseUrl( ) {
        // could use launch_presentation_return_url, but I think custom_canvas_api_domain is intended for this.
        return "https://" + custom_canvas_api_domain
    }



}