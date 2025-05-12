package gestionetudiants

import grails.gorm.services.Service

@Service(Etudiant)
interface EtudiantService {

    Etudiant get(Serializable id)

    List<Etudiant> list(Map args)

    Long count()

    void delete(Serializable id)

    Etudiant save(Etudiant etudiant)

}
