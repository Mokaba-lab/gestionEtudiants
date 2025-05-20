package org.example


class SecUserSecRole implements Serializable {

	private static final long serialVersionUID = 1

	SecUser secUser
	SecRole secRole

	static constraints = {
		secRole nullable: false
		secUser nullable: false
	}

	static mapping = {
		id composite: ['secUser', 'secRole']
		version false
	}

	static SecUserSecRole create(SecUser user, SecRole role, boolean flush = false) {
		def instance = new SecUserSecRole(secUser: user, secRole: role)
		instance.save(flush: flush)
		return instance
	}

	static boolean remove(SecUser user, SecRole role) {
		def instance = findBySecUserAndSecRole(user, role)
		if (!instance) {
			return false
		}
		instance.delete()
		return true
	}

	static void removeAll(SecUser user) {
		where { secUser == user }.deleteAll()
	}

	static void removeAll(SecRole role) {
		where { secRole == role }.deleteAll()
	}
}
