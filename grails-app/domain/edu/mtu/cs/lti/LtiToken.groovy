package edu.mtu.cs.lti

class LtiToken {

    Person person
    String applicationName

    String ltiToken
    Boolean ltiTokenRequired                      // params['custom_mtu_lti_token_required']
    String ltiAccessToken
    String ltiRefreshableToken
    String ltiTokenRequestState

    String ltiVersion

    Date dateCreated
    Date lastUpdated

    static constraints = {
        ltiToken(nullable: true)
        ltiAccessToken(nullable: true)
        ltiRefreshableToken(nullable: true)
        ltiTokenRequestState(nullable: true)
        ltiVersion(nullable: true)
        ltiTokenRequired(defaultValue: false)
    }

}
