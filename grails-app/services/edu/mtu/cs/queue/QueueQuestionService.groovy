package edu.mtu.cs.queue

import edu.mtu.cs.lti.Person
import grails.gorm.services.Service

@Service(QueueQuestion)
abstract class QueueQuestionService {

    def notNull(object, fallback) {
        if (object != null) {
            return object
        } else {
            return fallback
        }
    }

    QueueQuestion makeQuestion(Person person, String course, String courseName, String assignment, String assignmentName, String language, String ipaddress, String hostname, Boolean isHandRaised, Boolean isAnswered, String message) {
        new QueueQuestion(
                person: person
                , course: course
                , courseName: courseName
                , assignment: assignment
                , assignmentName: assignmentName
                , language: language
                , ipaddress: ipaddress
                , hostname: hostname
                , isHandRaised: notNull(isHandRaised, false)
                , isAnswered: notNull(isAnswered, false)
                , message: message
        )
    }


    abstract QueueQuestion get(Serializable id)

    abstract List<QueueQuestion> list(Map args)

    abstract Long count()

    abstract void delete(Serializable id)

    abstract QueueQuestion save(QueueQuestion question)

}
