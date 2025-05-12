package gestionetudiants

class LangueController {

    def changer(String lang) {
        if (lang) {
            session.locale = new Locale(lang)
        }
        redirect(uri: request.getHeader('referer') ?: '/')
    }
}
