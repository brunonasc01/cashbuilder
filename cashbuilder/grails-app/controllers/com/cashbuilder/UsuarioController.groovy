package com.cashbuilder

import com.cashbuilder.cmd.UsuarioCommand;
import com.cashbuilder.cmd.UsuarioEditCommand;
import com.cashbuilder.cmd.UsuarioEmailEditCommand;
import com.cashbuilder.cmd.UsuarioPasswordEditCommand;

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
	
	def edit_mail = {
		def user = session.user.attach()

		[usuario: user]
	}
	
	def edit_password = {
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
	
	def updateMail = { UsuarioEmailEditCommand uec ->
		try {
			def user = usuarioService.updateMail(uec)
			session.user = user

			flash.message = "E-mail atualizado com sucesso"
			redirect(controller: "administracao", action: "index")
		} catch(Exception e){
			flash.message = e.message
			render(view: "edit_mail", model: [usuario: session.user.attach()])
		}
	}
	
	def updatePassword = { UsuarioPasswordEditCommand upc ->
		try {
			def user = usuarioService.updatePassword(upc)
			session.user = user

			flash.message = "Senha atualizada com sucesso"
			redirect(controller: "administracao", action: "index")
		} catch(Exception e){
			flash.message = e.message
			
			render(view: "edit_password", model: [usuario: session.user.attach()])
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
	
	def editValidator = { UsuarioEditCommand urc ->

		def fieldName = params.fieldName
		urc.perfil.validate()
		def bean = urc

		if(fieldName.contains("perfil")){
			fieldName = fieldName.substring( fieldName.indexOf(".")+1,fieldName.size())
			bean = urc.perfil
		}
		
		if(fieldName.equals("FORM") && (urc.perfil.hasErrors() || urc.hasErrors())){
			render "${message(code: 'default.form.error.message', default: 'error')}"
		} else if(fieldName && bean.errors.hasFieldErrors(fieldName)){
			render g.renderErrors(bean: bean,field: fieldName)
		} else {
			render ""
		}
	}
	
	def emailEditValidator = { UsuarioEmailEditCommand uec ->
		
		def fieldName = params.fieldName

		if(fieldName.equals("FORM") && uec.hasErrors()){
			render "${message(code: 'default.form.error.message', default: 'error')}"
		} else if(fieldName && uec.errors.hasFieldErrors(fieldName)){
			render g.renderErrors(bean: uec,field: fieldName)
		}else {
			render ""
		}
	}
	
	def passwordEditValidator = { UsuarioPasswordEditCommand uec ->
		
		def fieldName = params.fieldName

		if(fieldName.equals("FORM") && uec.hasErrors()){
			render "${message(code: 'default.form.error.message', default: 'error')}"
		} else if(fieldName && uec.errors.hasFieldErrors(fieldName)){
			render g.renderErrors(bean: uec,field: fieldName)
		}else {
			render ""
		}
	}
}
