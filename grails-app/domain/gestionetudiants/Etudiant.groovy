package gestionetudiants

class Etudiant {

    String nom
    String prenom
    String email
    Integer age

    static constraints = {
        nom blank: false
        prenom blank: false
        email blank: false, email: true
        age min: 16, max: 99
    }
}
