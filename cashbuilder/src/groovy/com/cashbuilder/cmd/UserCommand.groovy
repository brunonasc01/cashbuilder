package com.cashbuilder.cmd

import com.cashbuilder.Profile;
import com.cashbuilder.User;

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
		importFrom User
				
		emailRepeat(
			validator: { email2, urc ->
					if(email2 != urc.email)
						return ['emailRepeated']
			})

		passwordRepeat(
			validator: { passwd2, urc ->
					if(passwd2 != urc.password)
						return ['passwordRepeated'] 
			})
	}
}
