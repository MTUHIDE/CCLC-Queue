package edu.mtu.cs.queue

import grails.gorm.services.Service

@Service(QueueFile)
interface QueueFileService {

    QueueFile get(Serializable id)

    List<QueueFile> list(Map args)

    Long count()

    void delete(Serializable id)

    QueueFile save(QueueFile queueFile)

}