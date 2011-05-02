package com.cashbuilder

import java.util.Date;

class UsuarioController {

    def scaffold = true
	
    //def index = { }
	
	def registro = {
				
	}
	
	def gravacao = { UsuarioRegistroCommand urc ->
		
		if(urc.hasErrors()){
			redirect(action:'registro',user:urc)
		}else{
			def user = new Usuario(urc.properties)
			user.properties = params

			if(user.validate()){
				user.save()
				redirect(controller:'login')
			}else{
				user.discard()
				redirect(action:'registro')
			}
			[user : urc]
		}
	}
}

class UsuarioRegistroCommand {
	
	String userId
	String password
	String passwordRepeat
	String email
	Date dateCreated
		
	static constraints = {
		userId(size:3..20)
		password(size: 6..8, blank: false,
					Validator: { passwd, user ->
						return passwd != user.userId
					})
		
		passwordRepeat(nullable: false,
			validator: { passwd2, urc ->
				return passwd2 == urc.password
			})

		email(email: true, nullable: true)
	}
}
