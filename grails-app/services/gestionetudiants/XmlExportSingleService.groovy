package gestionetudiants

import groovy.xml.MarkupBuilder

class XmlExportSingleService {

    def exportOneStudent (long id){
        def etudiant = Etudiant.get(id)
        if (!etudiant) return "<error>Student not found</error>"
        def writer = new StringWriter()
        def xml = new MarkupBuilder(writer)
        xml.student{
            "${'id'}"(etudiant.id)
            "${'nom'}"(etudiant.nom)
            "${'prenom'}"(etudiant.prenom)
            "${'email'}"(etudiant.email)
            "${'age'}"(etudiant.age)
        }
        return writer.toString()
    }
}
