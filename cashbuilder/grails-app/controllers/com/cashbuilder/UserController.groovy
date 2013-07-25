package com.cashbuilder

import com.cashbuilder.cmd.UserCommand
import com.cashbuilder.cmd.UserEmailCommand;
import com.cashbuilder.cmd.UserPasswordCommand;

class UserController {

	def generalService
    def userService
	def expensesList = ["Animal de Estimacao","Carro ou Moto","Filho(s)"]
	def recaptchaService
	
	static allowedMethods = [save: "POST", update: "POST", updatePassword:"POST", updateMail:"POST"]
	
	def signup(){
		[signup: true]
	}
	
	def edit() {
		def user = session.user.attach()

		render(view: "edit",model:[user:user])
	}
	
	def edit_mail() {
		def user = session.user.attach()

		[adm: true, user: user]
	}
	
	def edit_password() {
		def user = session.user.attach()

		UserPasswordCommand upc = new UserPasswordCommand()
		upc.id = user.id
		
		[adm: true, user: upc]
	}
	
	def save(UserCommand cmd) {
		
		if (!recaptchaService.verifyAnswer(session, request.getRemoteAddr(), params)) {
			generalService.buildMessage(Constants.MSG_ERROR,"form.signup.captcha.error.message")
		}		
		else if(cmd.validate()){
			if(userService.isEmailAvailable(cmd.email)){
				def user = new User(cmd.properties)
				user.password = Encoder.encode(user.password)
				
				if(user.save()){
					def files = getCategoryFiles(user)
					userService.buildProfile(user,files)
					session.user = user

					redirect(controller: "home")
				}
			} else {
				generalService.buildMessage(Constants.MSG_ERROR,"form.signup.email.error1.message")
			}
		} else {
			generalService.buildMessage(Constants.MSG_ERROR,"form.signup.data.error1.message")
		}

		render(view: "signup",model:[userInstance:cmd,signup: true])
	}
	
	def update() {
		def user = User.get(params.id)
		user.properties = params
		
		if(!user.validate()){
			user.profile.validate()

			flash.errors = g.renderErrors(bean: user)
			generalService.buildMessage(Constants.MSG_ERROR,"manager.user.update.data.error")
		} else{
			session.user = user
			generalService.buildMessage(Constants.MSG_SUCCESS,"Usuario atualizado com sucesso")
		}
		
		redirect(controller: "admin")
	}
	
	def updatePassword(UserPasswordCommand upc) {
		
		if(upc.validate()){
			def user = User.get(upc.id)

			if(user) {			
				String oldPassword = Encoder.encode(upc.password)
												
				if(!user.password.equals(oldPassword)){
					generalService.buildMessage(Constants.MSG_ERROR,"A senha atual esta incorreta")
				} else {
					user.password = Encoder.encode(upc.passwordNew)
					user.save(flush: true)
					session.user = user

					generalService.buildMessage(Constants.MSG_SUCCESS,"Senha atualizada com sucesso")
				}
			}
		} else {
			flash.errors = g.renderErrors(bean: upc)
			generalService.buildMessage(Constants.MSG_ERROR,"manager.user.update.password.error")
		}

		redirect(controller: "admin")
	}
	
	def updateMail(UserEmailCommand uec){
		
		if(uec.validate()){
			def user = User.get(uec.id)

			if(user){
				if(user.email != uec.email){
					generalService.buildMessage(Constants.MSG_ERROR,"O e-mail atual esta incorreto")
					
				} else if(!userService.isEmailAvailable(uec.emailNew)){
					generalService.buildMessage(Constants.MSG_ERROR,"form.signup.email.error1.message")

				} else {
					user.email = uec.emailNew
					user.save(flush: true)
					session.user = user

					generalService.buildMessage(Constants.MSG_SUCCESS,"E-Mail atualizado com sucesso")
				}
			}
		} else {
			flash.errors = g.renderErrors(bean: uec)
			generalService.buildMessage(Constants.MSG_ERROR,"manager.user.update.mail.error")
		}
		
		redirect(controller: "admin")
	}
	
	private def getCategoryFiles(User user){
		def files = []
		
		File fileGeral = grailsAttributes.getApplicationContext().getResource("res/categoriaGeral.csv").getFile()
		files += fileGeral

		def expensesFileMap = ["res/categoriaMascote.csv","res/categoriaVeiculo.csv","res/categoriaFilho.csv"]

		expensesFileMap.each { resourcePath ->
			File file = grailsAttributes.getApplicationContext().getResource(resourcePath).getFile()
			files += file
		}
		
		files
	}
}
