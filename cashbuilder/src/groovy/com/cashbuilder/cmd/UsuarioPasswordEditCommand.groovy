package com.cashbuilder.cmd

import java.util.Date;

class UsuarioPasswordEditCommand {
	
	long id

	String password
	String passwordNovo
	String passwordRepeat

	static constraints = {

		password(blank: false)
		
		passwordNovo(blank: false, size: 6..20,
			validator: { newPass, upc ->
					if(newPass.equals(upc.password))
						return ['passwordOld']
			})
		passwordRepeat(
			validator: { repeatPass, upc ->
					if(repeatPass != upc.passwordNovo)
						return ['passwordRepeated']
			})
	}
}
