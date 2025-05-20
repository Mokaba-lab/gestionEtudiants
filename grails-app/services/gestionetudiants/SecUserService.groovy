package gestionetudiants

import grails.gorm.transactions.Transactional
import org.example.SecRole
import org.example.SecUser
import org.example.SecUserSecRole

@Transactional
class SecUserService {

    void initSecurityData() {
        def adminRole = SecRole.findByAuthority('ROLE_ADMIN') ?: new SecRole(authority: 'ROLE_ADMIN').save()
        def managerRole = SecRole.findByAuthority('ROLE_MANAGER') ?: new SecRole(authority: 'ROLE_MANAGER').save()
        def viewerRole = SecRole.findByAuthority('ROLE_VIEWER') ?: new SecRole(authority: 'ROLE_VIEWER').save()


        def adminUser = SecUser.findByUsername('admin')
        if (!adminUser) {
            adminUser = new SecUser(
                    username: 'admin',
                    password: 'admin123',
                    enabled: true
            ).save(flush: true)
            SecUserSecRole.create(adminUser, adminRole, true)
        }

        // MANAGER
        def managerUser = SecUser.findByUsername('manager')
        if (!managerUser) {
            managerUser = new SecUser(
                    username: 'manager',
                    password: 'manager123',
                    enabled: true
            ).save(flush: true)
            SecUserSecRole.create(managerUser, managerRole, true)
        }

        // VIEWER
        def viewerUser = SecUser.findByUsername('viewer')
        if (!viewerUser) {
            viewerUser = new SecUser(
                    username: 'viewer',
                    password: 'viewer123',
                    enabled: true
            ).save(flush: true)
            SecUserSecRole.create(viewerUser, viewerRole, true)
        }
    }
}
