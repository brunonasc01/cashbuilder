package com.cashbuilder.cmd

import java.util.Date;

import com.cashbuilder.User;

import grails.validation.Validateable

@Validateable
class UserRegisterCommand {
	
	String firstName
	String lastName
	String email
	String emailRepeat
	String password
	String passwordRepeat
	String state
	String city
		
	Date dateCreated = new Date()
	Date lastLogin
		
	static constraints = {
		importFrom User
				
		emailRepeat(
			nullable: true,
			validator: { email2, urc ->
					if(email2 != urc.email)
						return ['emailRepeated']
			})

		passwordRepeat(
			nullable: true,
			validator: { passwd2, urc ->
					if(passwd2 != urc.password)
						return ['passwordRepeated'] 
			})
		
		state(blank: false)
		
		city(blank: false)
	}
}
