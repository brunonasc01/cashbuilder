package com.cashbuilder

import com.cashbuilder.cmd.UsuarioCommand;
import com.cashbuilder.utils.DateUtils;

class LoginController {

	def usuarioService
	def geralService
	def eventService
	
	static allowedMethods = [validate_access: "POST"]
	
    def index = {
		if(session.user){
			redirect(controller:'home')
		}
	}
	
	def validate_access = {
		def user = usuarioService.verifyLogin(params)
		
		if(user){
			session.user = user
			def perfil = user.perfil
			
			if(!perfil){
				redirect(controller:'perfil')
			}else {
				def budget = Orcamento.findByAnoAndUser(DateUtils.anoAtual,user)
			
				if(!budget){
					geralService.createNewBudget(user, DateUtils.anoAtual)
				}
		
				eventService.checkEvents(user, null)
				redirect(controller:'home')
			}
		}else{
			flash.message = "Usuário ou Senha inválidos"
			redirect(action:'index')
		}
	}
	
	def logoff = {
		session.user = null
		redirect(action:'index')
	}
	
	def validator = { UsuarioCommand urc ->
		
		def fieldName = params.fieldName

		if(fieldName.equals("FORM") && (urc.errors.hasFieldErrors("email") || urc.errors.hasFieldErrors("password"))){
			render "${message(code: 'default.form.error.message', default: 'erro')}"
		} else if(fieldName && urc.errors.hasFieldErrors(fieldName)){
			render g.renderErrors(bean: urc,field: fieldName)
		}else {
			render ""
		}
	}
}
