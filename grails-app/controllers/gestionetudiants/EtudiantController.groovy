package gestionetudiants

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN', 'ROLE_MANAGER'])
class EtudiantController {

    XmlImportService xmlImportService
    EtudiantService etudiantService
    XmlExportSingleService xmlExportSingleService

    static allowedMethods = [save: "POST",
                             update: "PUT",
                             delete: "DELETE",
                             exportXml: "GET",
                             importXml: "POST",
                             parseXml  : "POST"
    ]
    @Secured(['ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_VIEWER'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond etudiantService.list(params), model:[etudiantCount: etudiantService.count()]
    }
    @Secured(['ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_VIEWER'])
    def show(Long id) {
        respond etudiantService.get(id)
    }
    @Secured(['ROLE_ADMIN'])
    def create() {
        respond new Etudiant(params)
    }
    @Secured(['ROLE_ADMIN'])
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
    @Secured(['ROLE_ADMIN'])
    def edit(Long id) {
        respond etudiantService.get(id)
    }
    @Secured(['ROLE_ADMIN'])
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
    @Secured(['ROLE_ADMIN'])
    def exportXml(Long id) {
       def xmlContent = xmlExportSingleService.exportOneStudent(id)

        response.contentType = "application/xml"
        response.setHeader("Content-Disposition", "attachment; filename=etudiant_${id}.xml")
        render xmlContent
    }

    @Secured(['ROLE_ADMIN'])
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
    @Secured(['ROLE_ADMIN'])
    def importXml() {
        def file = request.getFile('xmlFile')
        if (!file || file.empty) {
            flash.message = "Veuillez sélectionner un fichier XML valide."
            redirect action: "create"
            return
        }

        try {
            Etudiant etudiant = xmlImportService.importOneStudent(file.inputStream)

            if (!etudiant.validate()) {
                flash.message = "Le fichier XML est invalide ou contient des erreurs."
                redirect action: "create"
                return
            }

            etudiantService.save(etudiant)
            flash.message = "Étudiant importé avec succès !"
            redirect action: "show", id: etudiant.id

        } catch (Exception e) {
            log.error("Erreur d'importation XML", e)
            flash.message = "Erreur lors de l'importation du fichier XML."
            redirect action: "create"
        }

    }

}
