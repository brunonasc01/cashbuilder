package com.cashbuilder.cmd

import grails.validation.Validateable;

@Validateable
class UserEmailCommand {
	
	long id

	String email
	String emailNew
	String emailRepeat

	static constraints = {

		email(email: true, blank:false)
		emailNew(email: true, blank:false,
			validator: { newMail, uec ->
					if(newMail.equals(uec.email))
						return ['emailOld']
			})
		emailRepeat(
			validator: { repeatMail, uec ->
					if(repeatMail != uec.emailNew)
						return ['emailRepeated']
			})
	}
}
