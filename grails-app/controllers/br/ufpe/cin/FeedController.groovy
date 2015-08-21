package br.ufpe.cin



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class FeedController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        if(session.user != null){
            params.max = Math.min(max ?: 10, 100)
            
            respond Feed.list(params), model:[feedInstanceCount: Feed.count()]
        }else{
            session.user = null
            redirect(controller:"user", action:"login")
        }
    }

    def show(Feed feedInstance) {
        respond feedInstance
    }

    def create() {
        respond new Feed(params)
    }

    @Transactional
    def save(Feed feedInstance) {
        if (feedInstance == null) {
            notFound()
            return
        }

        

        if (feedInstance.hasErrors()) {
            respond feedInstance.errors, view:'create'
            return
        }


        feedInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'feed.label', default: 'Feed'), feedInstance.id])
                redirect feedInstance
            }
            '*' { respond feedInstance, [status: CREATED] }
        }
    }

    def edit(Feed feedInstance) {
        respond feedInstance
    }

    @Transactional
    def update(Feed feedInstance) {
        if (feedInstance == null) {
            notFound()
            return
        }

        if (feedInstance.hasErrors()) {
            respond feedInstance.errors, view:'edit'
            return
        }

        feedInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Feed.label', default: 'Feed'), feedInstance.id])
                redirect feedInstance
            }
            '*'{ respond feedInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Feed feedInstance) {

        if (feedInstance == null) {
            notFound()
            return
        }

        feedInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Feed.label', default: 'Feed'), feedInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'feed.label', default: 'Feed'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
