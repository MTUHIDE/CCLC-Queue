package edu.mtu.cs.queue

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class QueueAnswerServiceSpec extends Specification {

    QueueAnswerService queueAnswerService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new QueueAnswer(...).save(flush: true, failOnError: true)
        //new QueueAnswer(...).save(flush: true, failOnError: true)
        //QueueAnswer queueAnswer = new QueueAnswer(...).save(flush: true, failOnError: true)
        //new QueueAnswer(...).save(flush: true, failOnError: true)
        //new QueueAnswer(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //queueAnswer.id
    }

    void "test get"() {
        setupData()

        expect:
        queueAnswerService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<QueueAnswer> queueAnswerList = queueAnswerService.list(max: 2, offset: 2)

        then:
        queueAnswerList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        queueAnswerService.count() == 5
    }

    void "test delete"() {
        Long queueAnswerId = setupData()

        expect:
        queueAnswerService.count() == 5

        when:
        queueAnswerService.delete(queueAnswerId)
        sessionFactory.currentSession.flush()

        then:
        queueAnswerService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        QueueAnswer queueAnswer = new QueueAnswer()
        queueAnswerService.save(queueAnswer)

        then:
        queueAnswer.id != null
    }
}
