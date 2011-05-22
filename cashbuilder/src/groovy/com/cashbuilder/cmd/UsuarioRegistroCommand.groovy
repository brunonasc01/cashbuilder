package com.cashbuilder.cmd

import java.util.Date;

class UsuarioRegistroCommand {
	
	String userId
	String password
	String passwordRepeat
	String email
	Date dateCreated
		
	static constraints = {
		userId(size:3..20, blank: false)
		password(size: 6..8, blank: false,
					Validator: { passwd, user ->
						return passwd != user.userId
					})
		
		passwordRepeat(nullable: false,
			validator: { passwd2, urc ->
					if(passwd2 != urc.password)
						return ['passwordRepeated'] 
			})

		email(email: true, nullable: true)
	}
}
