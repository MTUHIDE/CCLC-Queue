package edu.mtu.cs.queue

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class QueueFileController {

    QueueFileService queueFileService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond queueFileService.list(params), model:[queueFileCount: queueFileService.count()]
    }

    def show(Long id) {
        respond queueFileService.get(id)
    }

    def create() {
        respond new QueueFile(params)
    }

    def save(QueueFile queueFile) {
        if (queueFile == null) {
            notFound()
            return
        }

        try {
            queueFileService.save(queueFile)
        } catch (ValidationException e) {
            respond queueFile.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'queueFile.label', default: 'QueueFile'), queueFile.id])
                redirect queueFile
            }
            '*' { respond queueFile, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond queueFileService.get(id)
    }

    def update(QueueFile queueFile) {
        if (queueFile == null) {
            notFound()
            return
        }

        try {
            queueFileService.save(queueFile)
        } catch (ValidationException e) {
            respond queueFile.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'queueFile.label', default: 'QueueFile'), queueFile.id])
                redirect queueFile
            }
            '*'{ respond queueFile, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        queueFileService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'queueFile.label', default: 'QueueFile'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'queueFile.label', default: 'QueueFile'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
