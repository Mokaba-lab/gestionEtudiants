package gestionetudiants

class BootStrap {

    SecUserService secUserService

    def init = { servletContext ->
        secUserService.initSecurityData()
    }

    def destroy = {}
}
