package gestionetudiants

class UrlMappings {

    static mappings = {
        // Route par défaut
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        // Route pour l'export XML
        "/etudiant/$id/exportXml"(controller: "etudiant", action: "exportXml")

        // Routes par défaut pour l'accueil et les erreurs
        "/"(controller: 'login', action: 'auth')
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
