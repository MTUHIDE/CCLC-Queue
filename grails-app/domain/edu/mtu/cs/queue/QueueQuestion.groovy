package edu.mtu.cs.queue

import edu.mtu.MtuConstants
import edu.mtu.cs.lti.Person

class QueueQuestion implements MtuConstants{

    Person person

    String course
    String courseName
    String assignment
    String assignmentName

    String language

    String ipaddress
    String hostname

    Boolean isHandRaised = false
    Boolean isAnswered = false

    Boolean isDeleted = false
    Person deletedBy

    String subject
    String message

    Date dateCreated
    Date lastUpdated

    static hasMany = [files: QueueFile, answers: QueueAnswer ]

    static mapping = {
        message type: 'text'
        isHandRaised defaultValue: false
        isAnswered defaultValue: false
        isDeleted defaultValue: false
        assignment defaultvalue: ''
    }

    static constraints = {
        files(nullable: true)
        answers(nullable: true)
        deletedBy(nullable: true)
    }

    public String location( ) {
        String result = "Off Campus"
        if ( hostname?.endsWith("mtu.edu") ) {
            result = "On Campus"
            if ( hostname.startsWith("cslc") ) {
                result = "CSLC Rekhi 118"
            } else if ( hostname.startsWith("c") ) {
                result = BUILDINGS[hostname.substring(1,4)] + " " + hostname.substring(5,9) + " " + hostname.substring(11,13)
            } else if (hostname.startsWith("rover")) {
                result = "Rovernet"
            }
        }
        return result
    }

}
