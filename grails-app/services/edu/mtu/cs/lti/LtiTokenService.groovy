package edu.mtu.cs.lti

import grails.gorm.services.Service

@Service(LtiToken)
interface LtiTokenService {

    LtiToken get(Serializable id)

    List<LtiToken> list(Map args)

    Long count()

    void delete(Serializable id)

    LtiToken save(LtiToken ltiToken)

}
