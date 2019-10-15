package edu.mtu.cs.lti

import grails.gorm.services.Service
import grails.util.Environment

@Service(LtiClient)
abstract class LtiClientService {

    LtiClient getClient( String clientID ) {
        String appEnvironment = Environment.current.name
        return LtiClient.findByAppEnvironmentAndClientId(appEnvironment, clientID)
    }

    abstract LtiClient get(Serializable id)

    abstract List<LtiClient> list(Map args)

    abstract Long count()

    abstract void delete(Serializable id)

    abstract LtiClient save(LtiClient ltiClient)

}