package edu.mtu.cs.lti

import grails.gorm.services.Service

@Service(LtiSession)
interface LtiSessionService {

    LtiSession get(Serializable id)

    List<LtiSession> list(Map args)

    Long count()

    void delete(Serializable id)

    LtiSession save(LtiSession ltiSession)
}