package edu.mtu.cs.lti

class Person {

    String userID
    String ltiID
    String canvasID
    String eMail
    String fullName
    String firstName
    String lastName
    String imagePath

    Date dateCreated
    Date lastUpdated

    static mapping = {
        imagePath type: 'text'
    }

    static constraints = {
        ltiID(blank: true, nullable: true)
        canvasID(blank: true, nullable: true)
        eMail(blank: true, nullable: true)
        imagePath(blank: true, nullable: true)
    }
}
