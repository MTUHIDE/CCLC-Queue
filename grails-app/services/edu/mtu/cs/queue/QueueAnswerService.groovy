package edu.mtu.cs.queue

import edu.mtu.cs.lti.Person
import grails.gorm.services.Service

@Service(QueueAnswer)
abstract class QueueAnswerService {

    def notNull(object, fallback) {
        if (object != null) {
            return object
        } else {
            return fallback
        }
    }

    QueueAnswer makeAnswer(Person person, QueueQuestion question, String answerText) {
        new QueueAnswer(
                person: person
                , question: question
                , answerText: answerText
                , accepted: false
        )
    }


    abstract QueueAnswer get(Serializable id)

    abstract List<QueueAnswer> list(Map args)

    abstract Long count()

    abstract void delete(Serializable id)

    abstract QueueAnswer save(QueueAnswer Answer)

}
