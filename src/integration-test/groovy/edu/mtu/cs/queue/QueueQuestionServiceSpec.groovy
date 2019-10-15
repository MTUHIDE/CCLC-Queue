package edu.mtu.cs.queue

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class QueueQuestionServiceSpec extends Specification {

    QueueQuestionService queueQuestionService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new QueueQuestion(...).save(flush: true, failOnError: true)
        //new QueueQuestion(...).save(flush: true, failOnError: true)
        //QueueQuestion queueQuestion = new QueueQuestion(...).save(flush: true, failOnError: true)
        //new QueueQuestion(...).save(flush: true, failOnError: true)
        //new QueueQuestion(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //queueQuestion.id
    }

    void "test get"() {
        setupData()

        expect:
        queueQuestionService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<QueueQuestion> queueQuestionList = queueQuestionService.list(max: 2, offset: 2)

        then:
        queueQuestionList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        queueQuestionService.count() == 5
    }

    void "test delete"() {
        Long queueQuestionId = setupData()

        expect:
        queueQuestionService.count() == 5

        when:
        queueQuestionService.delete(queueQuestionId)
        sessionFactory.currentSession.flush()

        then:
        queueQuestionService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        QueueQuestion queueQuestion = new QueueQuestion()
        queueQuestionService.save(queueQuestion)

        then:
        queueQuestion.id != null
    }
}
