package edu.mtu.cs.queue

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class QueueFileServiceSpec extends Specification {

    QueueFileService queueFileService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new QueueFile(...).save(flush: true, failOnError: true)
        //new QueueFile(...).save(flush: true, failOnError: true)
        //QueueFile queueFile = new QueueFile(...).save(flush: true, failOnError: true)
        //new QueueFile(...).save(flush: true, failOnError: true)
        //new QueueFile(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //queueFile.id
    }

    void "test get"() {
        setupData()

        expect:
        queueFileService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<QueueFile> queueFileList = queueFileService.list(max: 2, offset: 2)

        then:
        queueFileList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        queueFileService.count() == 5
    }

    void "test delete"() {
        Long queueFileId = setupData()

        expect:
        queueFileService.count() == 5

        when:
        queueFileService.delete(queueFileId)
        sessionFactory.currentSession.flush()

        then:
        queueFileService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        QueueFile queueFile = new QueueFile()
        queueFileService.save(queueFile)

        then:
        queueFile.id != null
    }
}
