package gestionetudiants

class Etudiant {

    String nom
    String dnom
    String prenom
    String email
    Date dateNaissance

    static constraints = {
        dnom black: false
        nom blank: false
        prenom blank: false
        email blank: false, email: true
        dateNaissance nullable: false
    }
}
