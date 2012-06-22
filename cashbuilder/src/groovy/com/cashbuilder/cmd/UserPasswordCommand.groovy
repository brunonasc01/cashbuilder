package com.cashbuilder.cmd

import grails.validation.Validateable;

@Validateable
class UserPasswordCommand {
	
	long id

	String password
	String passwordNew
	String passwordRepeat

	static constraints = {

		password(blank: false)
		
		passwordNew(blank: false, size: 6..20,
			validator: { newPass, upc ->
					if(newPass.equals(upc.password))
						return ['passwordOld']
			})
		passwordRepeat(
			validator: { repeatPass, upc ->
					if(repeatPass != upc.passwordNew)
						return ['passwordRepeated']
			})
	}
}
