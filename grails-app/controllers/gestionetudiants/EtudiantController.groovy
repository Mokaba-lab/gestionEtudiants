package gestionetudiants

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class EtudiantController {

    EtudiantService etudiantService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond etudiantService.list(params), model:[etudiantCount: etudiantService.count()]
    }

    def show(Long id) {
        respond etudiantService.get(id)
    }

    def create() {
        respond new Etudiant(params)
    }

    def save(Etudiant etudiant) {
        if (etudiant == null) {
            notFound()
            return
        }

        try {
            etudiantService.save(etudiant)
        } catch (ValidationException e) {
            respond etudiant.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'etudiant.label', default: 'Etudiant'), etudiant.id])
                redirect etudiant
            }
            '*' { respond etudiant, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond etudiantService.get(id)
    }

    def update(Etudiant etudiant) {
        if (etudiant == null) {
            notFound()
            return
        }

        try {
            etudiantService.save(etudiant)
        } catch (ValidationException e) {
            respond etudiant.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'etudiant.label', default: 'Etudiant'), etudiant.id])
                redirect etudiant
            }
            '*'{ respond etudiant, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        etudiantService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'etudiant.label', default: 'Etudiant'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'etudiant.label', default: 'Etudiant'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
