package org.example


import groovy.transform.EqualsAndHashCode

@EqualsAndHashCode(includes='username')
class SecUser implements Serializable {

    private static final long serialVersionUID = 1

    String username
    String password



    static hasMany = [authorities: SecRole]

    static constraints = {
        username blank: false, unique: true
        password blank: false
    }

    static mapping = {
        password column: '`password`'
    }

    Set<SecRole> getAuthorities() {
        SecUserSecRole.findAllBySecUser(this)*.secRole
    }
}
