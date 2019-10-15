package edu.mtu.cs.lti

/**
 * Created by Leo on 7/19/17.
 *
 */
public interface LtiConstants {

    public static final List<String> LTI_FIELDNAMES = [
            'context_id',
            'context_label',
            'context_title',
            'custom_canvas_api_domain',
            'custom_canvas_assignment_id',
            'custom_canvas_assignment_points_possible',
            'custom_canvas_assignment_title',
            'custom_canvas_course_id',
            'custom_canvas_enrollment_state',
            'custom_canvas_user_id',
            'custom_canvas_user_login_id',
            'custom_canvas_workflow_state',
            'custom_mtu_application_name',
            'custom_mtu_client_id',
            'custom_mtu_controller_name',
            'custom_mtu_page_name',
            'custom_mtu_canvas_role',
            'custom_mtu_lti_token_required',
            'ext_ims_lis_basic_outcome_url',
            'ext_lti_assignment_id',
            'ext_outcome_data_values_accepted',
            'ext_outcome_result_total_score_accepted',
            'ext_outcome_submission_submitted_at_accepted',
            'ext_outcomes_tool_placement_url',
            'ext_roles',
            'launch_presentation_document_target',
            'launch_presentation_height',
            'launch_presentation_width',
            'launch_presentation_locale',
            'launch_presentation_return_url',
            'lis_outcome_service_url',
            'lis_person_contact_email_primary',
            'lis_person_name_family',
            'lis_person_name_full',
            'lis_person_name_given',
            'lis_person_sourcedid',
            'lis_result_sourcedid',
            'lti_message_type',
            'lti_version',
            'resource_link_id',
            'resource_link_title',
            'roles',
            'tool_consumer_info_product_family_code',
            'tool_consumer_info_version',
            'tool_consumer_instance_contact_email',
            'tool_consumer_instance_guid',
            'tool_consumer_instance_name',
            'user_id',
            'user_image'
    ]

    public static final Map<String, String> IP_WHITELIST = [
            // Wireless IP seems to float
            // '141.219.XXX.YYY' : 'Name, Device Description'
            // Wired IP seems to float!
            // , '141.219.XXX.YYY' : 'Name, Device Description'
    ]

    /**
     * A template string for creating ReplaceResult messages.
     *
     * Use like:
     * <pre>
     *     String.format(
     *       ReplaceResultMessageTemplate,
     *       messageId,
     *       timestamp,  // "2017-04-16T18:54:36.736+00:00" iso8601 formatted timestamp
     *       sourcedId,
     *       resultScore,
     *       resultDataXml
     *     )
     * </pre>
     *
     *
     */
    public static final String ReplaceResultMessageTemplate =
            """<?xml version = "1.0" encoding = "UTF-8"?>
                    <imsx_POXEnvelopeRequest xmlns="http://www.imsglobal.org/services/ltiv1p1/xsd/imsoms_v1p0">
                    	<imsx_POXHeader>
                    		<imsx_POXRequestHeaderInfo>
                    			<imsx_version>V1.0</imsx_version>
                    			<imsx_messageIdentifier>%s</imsx_messageIdentifier>
                    		</imsx_POXRequestHeaderInfo>
                    	</imsx_POXHeader>
                    	<imsx_POXBody>
                    		<replaceResultRequest>
                               <submissionDetails>
                                   <submittedAt>%s</submittedAt>
                               </submissionDetails>
                    			<resultRecord>
                    				<sourcedGUID>
                    					<sourcedId>%s</sourcedId>
                    				</sourcedGUID>
                    				<result>
                    					<resultScore>
                    						<language>en</language>
                    						<textString>%s</textString>
                    					</resultScore>
                    					%s
                    				</result>
                    			</resultRecord>
                    		</replaceResultRequest>
                    	</imsx_POXBody>
                    </imsx_POXEnvelopeRequest>"""

    /**
     * A template string for creating ReplaceResult messages.
     *
     * Similar to {@link #ReplaceResultMessageTemplate},
     * except has support for the Canvas Total Score Return Extension
     *
     * This allows a total score to be assigned instead of a percentage.
     *
     * This can be used if the ltiSession value of
     * ext_outcome_result_total_score_accepted=true
     *
     * Use like:
     * <pre>
     *     String.format(
     *       ReplaceResultTotalScoreMessageTemplate,
     *       messageId,
     *       timestamp,  // "2017-04-16T18:54:36.736+00:00" iso8601 formatted timestamp
     *       sourcedId,
     *       resultScore,
     *       resultDataXml
     *     )
     * </pre>
     *
     *
     */
    public static final String ReplaceResultTotalScoreMessageTemplate =
            """<?xml version = "1.0" encoding = "UTF-8"?>
                    <imsx_POXEnvelopeRequest xmlns="http://www.imsglobal.org/services/ltiv1p1/xsd/imsoms_v1p0">
                    	<imsx_POXHeader>
                    		<imsx_POXRequestHeaderInfo>
                    			<imsx_version>V1.0</imsx_version>
                    			<imsx_messageIdentifier>%s</imsx_messageIdentifier>
                    		</imsx_POXRequestHeaderInfo>
                    	</imsx_POXHeader>
                    	<imsx_POXBody>
                    		<replaceResultRequest>
                               <submissionDetails>
                                   <submittedAt>%s</submittedAt>
                               </submissionDetails>
                    			<resultRecord>
                    				<sourcedGUID>
                    					<sourcedId>%s</sourcedId>
                    				</sourcedGUID>
                    				<result>
                    					<resultTotalScore>
                    						<language>en</language>
                    						<textString>%s</textString>
                    					</resultTotalScore>
                    					%s
                    				</result>
                    			</resultRecord>
                    		</replaceResultRequest>
                    	</imsx_POXBody>
                    </imsx_POXEnvelopeRequest>"""
}