package gestionetudiants

class Etudiant {

    String nom
    String prenom
    String email
    Integer dateNaissance

    static constraints = {
        nom blank: false
        prenom blank: false
        email blank: false, email: true
        dateNaissance nullable: false, min: 16, max: 99
    }
}
