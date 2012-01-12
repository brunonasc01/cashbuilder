package com.cashbuilder

import com.cashbuilder.cmd.UsuarioCommand;
import com.cashbuilder.cmd.UsuarioEditCommand;

class UsuarioController {

	def usuarioService
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def novo = { 
		
	}
	
	def save = { UsuarioCommand urc ->
		try{
			def newUser = usuarioService.saveUser(urc)
			flash.message = "Usuario registrado com sucesso"
			redirect(controller: "administracao", action: "login")
		}catch(Exception e){
			flash.message = e.message
			render(view: "novo")
		}
	}

    def edit = {
		def user = session.user.attach()

		[usuario: user]
    }

    def update = {
		try {
			def user = usuarioService.updateUser(params)
			session.user = user

			flash.message = "Usuario atualizado com sucesso"
			redirect(controller: "administracao", action: "index")
		} catch(Exception e){
			flash.message = e.message
			render(view: "edit")
		}
    }

    def delete = {
       
    }
	
	def validator = { UsuarioCommand urc ->
		
		def fieldName = params.fieldName

		if(fieldName.equals("FORM") && urc.hasErrors()){
			render "${message(code: 'default.form.error.message', default: 'error')}"
		} else if(fieldName && urc.errors.hasFieldErrors(fieldName)){
			render g.renderErrors(bean: urc,field: fieldName)
		}else {
			render ""
		}
	}
}
