package br.ufpe.cin



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def login = {}

    def authenticate = {

        def user = null 
            if(user){
              session.user = user
              flash.message = "Olá ${user.nome}!"
              redirect(controller:"feed", action:"index")
            }else{
              flash.message = "Email e/ou senha incorreto(s)!"
              redirect(action:"login")
            }
    }

    def logout = {
        session.user = null
        redirect(controller:"user", action:"login")
    }

    def index(Integer max) {

        if(session.user != null){
            params.max = Math.min(max ?: 10, 100)
            respond User.list(params), model:[userInstanceCount: User.count()]
        }else{
            session.user = null
            redirect(controller:"user", action:"login")
        }
    }

    def show(User userInstance) {
        respond userInstance
    }

    def create() {
        respond new User(params)
    }

    @Transactional
    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'create'
            return
        }

        def user = null
            
            if(user){
                flash.message = "Email já cadastrado!"
                redirect(controller:"user", action:"create")
              
            }else{
              userInstance.save flush:true

                request.withFormat {
                    form multipartForm {
                        flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'Usuario'), userInstance.id])
                        session.user = null
                        redirect(controller:"user", action:"login")
                    }
                    '*' { respond userInstance, [status: CREATED] }
                }
            }
    }

    def edit(User userInstance) {
        respond userInstance
    }

    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'edit'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*'{ respond userInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
