package edu.mtu.cs.queue

import edu.mtu.cs.lti.Person

class QueueAnswer {

    Person person

    String answerText // HTML Text
    Boolean isAccepted = false
    Boolean emailSent = false

    Boolean isDeleted = false
    Person deletedBy

    String ipaddress
    String hostname

    static hasMany = [ files: QueueFile ]
    static hasOne = [ question: QueueQuestion ]

    Date dateCreated
    Date lastUpdated

    static mapping = {
        answerText type: 'text'
    }

    static constraints = {
        files(nullable: true)
        deletedBy(nullable: true)
    }
}
