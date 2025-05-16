package gestionetudiants

import grails.gorm.transactions.Transactional
import groovy.xml.XmlSlurper

@Transactional
class XmlImportService {

    Etudiant importOneStudent(InputStream xmlStream) {
        def xml = new XmlSlurper().parse(xmlStream)

        return new Etudiant(
                nom: xml.nom.text(),
                prenom: xml.prenom.text(),
                email: xml.email.text(),
                dateNaissance: xml.dateNaissance.toInteger()
        )
    }
}
