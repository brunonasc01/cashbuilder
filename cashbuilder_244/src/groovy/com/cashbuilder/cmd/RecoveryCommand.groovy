package com.cashbuilder.cmd

import grails.validation.Validateable;

@Validateable
class RecoveryCommand {
	
	String token
	String passwordNew
	String passwordRepeat
	
	static constraints = {
				
		passwordNew(blank: false, size: 6..20)

		passwordRepeat(
			validator: { repeatPass, upc ->
					if(repeatPass != upc.passwordNew)
						return ['passwordRepeated']
			})
	}

}
