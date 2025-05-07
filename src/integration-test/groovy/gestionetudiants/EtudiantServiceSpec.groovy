package gestionetudiants

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class EtudiantServiceSpec extends Specification {

    EtudiantService etudiantService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Etudiant(...).save(flush: true, failOnError: true)
        //new Etudiant(...).save(flush: true, failOnError: true)
        //Etudiant etudiant = new Etudiant(...).save(flush: true, failOnError: true)
        //new Etudiant(...).save(flush: true, failOnError: true)
        //new Etudiant(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //etudiant.id
    }

    void "test get"() {
        setupData()

        expect:
        etudiantService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Etudiant> etudiantList = etudiantService.list(max: 2, offset: 2)

        then:
        etudiantList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        etudiantService.count() == 5
    }

    void "test delete"() {
        Long etudiantId = setupData()

        expect:
        etudiantService.count() == 5

        when:
        etudiantService.delete(etudiantId)
        sessionFactory.currentSession.flush()

        then:
        etudiantService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Etudiant etudiant = new Etudiant()
        etudiantService.save(etudiant)

        then:
        etudiant.id != null
    }
}
