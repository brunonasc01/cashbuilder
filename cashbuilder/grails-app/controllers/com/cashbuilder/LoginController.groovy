package com.cashbuilder

class LoginController {

    def index = {
				
    }
		
	def autenticacao = {
		
		session.user = Usuario.findByUserIdAndPassword(params.userId,params.password)
		
		if(session.user){
			redirect(controller:'home')
		}else{
			flash.message = "Usuário ou Senha inválidos"
			redirect(action:'index')
		}
	}
	
	def logoff = {

		session.user = null
		redirect(controller:'login')
	}
}
