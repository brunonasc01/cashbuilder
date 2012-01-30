package com.cashbuilder.cmd

import java.util.Date;

import org.apache.commons.lang.Validate;

class UsuarioEmailEditCommand {
	
	long id

	String email
	String emailNovo
	String emailRepeat

	static constraints = {

		email(email: true, blank:false)
		emailNovo(email: true, blank:false,
			validator: { newMail, uec ->
					if(newMail.equals(uec.email))
						return ['emailOld']
			})
		emailRepeat(
			validator: { repeatMail, uec ->
					if(repeatMail != uec.emailNovo)
						return ['emailRepeated']
			})
	}
}
