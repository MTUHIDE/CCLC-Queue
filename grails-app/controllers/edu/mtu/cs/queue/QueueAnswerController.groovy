package edu.mtu.cs.queue

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class QueueAnswerController {

    QueueAnswerService queueAnswerService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond queueAnswerService.list(params), model:[queueAnswerCount: queueAnswerService.count()]
    }

    def show(Long id) {
        respond queueAnswerService.get(id)
    }

    def create() {
        respond new QueueAnswer(params)
    }

    def save(QueueAnswer queueAnswer) {
        if (queueAnswer == null) {
            notFound()
            return
        }

        try {
            queueAnswerService.save(queueAnswer)
        } catch (ValidationException e) {
            respond queueAnswer.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'queueAnswer.label', default: 'QueueAnswer'), queueAnswer.id])
                redirect queueAnswer
            }
            '*' { respond queueAnswer, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond queueAnswerService.get(id)
    }

    def update(QueueAnswer queueAnswer) {
        if (queueAnswer == null) {
            notFound()
            return
        }

        try {
            queueAnswerService.save(queueAnswer)
        } catch (ValidationException e) {
            respond queueAnswer.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'queueAnswer.label', default: 'QueueAnswer'), queueAnswer.id])
                redirect queueAnswer
            }
            '*'{ respond queueAnswer, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        queueAnswerService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'queueAnswer.label', default: 'QueueAnswer'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'queueAnswer.label', default: 'QueueAnswer'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
