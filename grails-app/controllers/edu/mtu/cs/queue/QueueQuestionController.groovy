package edu.mtu.cs.queue

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class QueueQuestionController {

    QueueQuestionService queueQuestionService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond queueQuestionService.list(params), model:[queueQuestionCount: queueQuestionService.count()]
    }

    def show(Long id) {
        respond queueQuestionService.get(id)
    }

    def create() {
        respond new QueueQuestion(params)
    }

    def save(QueueQuestion queueQuestion) {
        if (queueQuestion == null) {
            notFound()
            return
        }

        try {
            queueQuestionService.save(queueQuestion)
        } catch (ValidationException e) {
            respond queueQuestion.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'queueQuestion.label', default: 'QueueQuestion'), queueQuestion.id])
                redirect queueQuestion
            }
            '*' { respond queueQuestion, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond queueQuestionService.get(id)
    }

    def update(QueueQuestion queueQuestion) {
        if (queueQuestion == null) {
            notFound()
            return
        }

        try {
            queueQuestionService.save(queueQuestion)
        } catch (ValidationException e) {
            respond queueQuestion.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'queueQuestion.label', default: 'QueueQuestion'), queueQuestion.id])
                redirect queueQuestion
            }
            '*'{ respond queueQuestion, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        queueQuestionService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'queueQuestion.label', default: 'QueueQuestion'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'queueQuestion.label', default: 'QueueQuestion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
