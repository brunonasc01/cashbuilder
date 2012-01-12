package com.cashbuilder.cmd

import java.util.Date;

class UsuarioEditCommand {
	
	String nome
	String nomeCompleto
	String cidade
	String estado
	String pais
		
	String emailAtual
	String emailNovo
	String emailRepeat
	
	String passwordAtual
	String passwordNovo
	String passwordRepeat
	
	Date dateCreated
		
	static constraints = {
		nome(size:3..20, blank: false)
		nomeCompleto(blank: false, maxLength:40)
		cidade(blank: false)
		estado(blank: false)
		pais(blank: false)
		
		emailAtual(email: true, blank:false)
		emailNovo(email: true, blank:false,
			validator: { email2, uec ->
					if(email2 != uec.emailAtual)
						return ['emailOld']
			})
		emailRepeat(nullable: false,
			validator: { email2, uec ->
					if(email2 != uec.emailNovo)
						return ['emailRepeated']
			})

		passwordAtual(size: 6..20, blank: false)
		passwordNovo(nullable: false,
			validator: { passwd2, urc ->
					if(passwd2 != urc.passwordAtual)
						return ['passwordOld']
			})
		passwordRepeat(nullable: false,
			validator: { passwd2, urc ->
					if(passwd2 != urc.passwordAtual)
						return ['passwordRepeated']
			})
	}
}
