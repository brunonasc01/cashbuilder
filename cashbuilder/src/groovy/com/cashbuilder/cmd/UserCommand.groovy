package com.cashbuilder.cmd

import com.cashbuilder.Profile;
import grails.validation.Validateable

@Validateable
class UserCommand {
	
	String firstName
	String lastName
	String email
	String emailRepeat
	String password
	String passwordRepeat
	Profile profile
	
	Date dateCreated
		
	static constraints = {
		firstName(size:3..20,blank:false)
		lastName(size:3..30,blank:false)
		email(email: true, blank:false)
		emailRepeat(
			validator: { email2, urc ->
					if(email2 != urc.email)
						return ['emailRepeated']
			})
				
		password(minSize:6, blank: false,
					Validator: { passwd, user ->
						return passwd != user.nome
					})		
		passwordRepeat(
			validator: { passwd2, urc ->
					if(passwd2 != urc.password)
						return ['passwordRepeated'] 
			})
	}
}
