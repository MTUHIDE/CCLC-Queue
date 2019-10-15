package edu.mtu.cs.queue

class QueueFile {

    static hasOne = [question: QueueQuestion, answer: QueueAnswer ]

    String fileName
    byte[] fileData
    String fileMimeType

    Date dateCreated
    Date lastUpdated

    static mappings = {
        fileData sqltype: 'longblob'
    }

    static constraints = {
        fileName(blank:false,nullable:false)
        fileData(blank: true, nullable:true, maxSize:1073741824)
        question(nullable:true)
        answer(nullable:true)
    }
}
