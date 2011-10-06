package com.cashbuilder.cmd

import java.util.Date;

class UsuarioCommand {
	
	String email
	String emailRepeat
	String nome
	String password
	String passwordRepeat
	
	Date dateCreated
		
	static constraints = {
		email(email: true, blank:false)
		emailRepeat(nullable: false,
			validator: { email2, urc ->
					if(email2 != urc.email)
						return ['emailRepeated']
			})
		
		nome(size:3..20, blank: false)
		password(size: 6..8, blank: false,
					Validator: { passwd, user ->
						return passwd != user.nome
					})		
		passwordRepeat(nullable: false,
			validator: { passwd2, urc ->
					if(passwd2 != urc.password)
						return ['passwordRepeated'] 
			})
	}
}
