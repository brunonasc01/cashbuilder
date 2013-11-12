package com.cashbuilder

import com.cashbuilder.cmd.UserCommand
import com.cashbuilder.cmd.UserEmailCommand;
import com.cashbuilder.cmd.UserPasswordCommand;
import com.cashbuilder.cmd.UserUpdateCommand;

class UserController {

	def generalService
    def userService
	def expensesList = ["Animal de Estimacao","Carro ou Moto","Filho(s)"]
	def recaptchaService
	
	static allowedMethods = [save: "POST", update: "POST", updatePassword:"POST", updateMail:"POST"]
	
	def signup(){
		[signup: true]
	}
	
	def edit_modal() {
		def user = session.user.attach()

		render(view: "edit_modal",model:[user:user])
	}
	
	def edit() {
		def user = session.user.attach()
		
		[adm: true, user: user]
	}
	
	def edit_modal_mail() {
		render(view: "edit_modal_mail")
	}
	
	def edit_mail() {
		[adm: true]
	}
	
	def edit_modal_password() {
		render(view: "edit_modal_password")
	}
	
	def edit_password() {
		[adm: true]
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
	
	def update(UserUpdateCommand uuc) {
		def user = session.user.attach()

		if(!uuc.validate()){
			uuc.profile.validate()

			flash.errors = g.renderErrors(bean: uuc)
			generalService.buildMessage(Constants.MSG_ERROR,"manager.user.update.data.error")
		} else{
			user.properties = uuc.properties
		
			session.user = user
			generalService.buildMessage(Constants.MSG_SUCCESS,"Usuario atualizado com sucesso")
		}
		
		boolean full_scr = params.full_scr
		
		if(full_scr & uuc.hasErrors()){
			render(view: "edit", model:[adm: true, user:user])
		} else {
			redirect(controller: "admin")
		}
	}
	
	def updatePassword(UserPasswordCommand upc) {
		
		def user = session.user.attach()
		
		if(upc.validate()){

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

		boolean full_scr = params.full_scr
		
		if(full_scr & upc.hasErrors()){
			render(view: "edit_password", model:[adm: true])
		} else {
			redirect(controller: "admin")
		}
	}
	
	def updateMail(UserEmailCommand uec){
		
		def user = session.user.attach()
		
		if(uec.validate()){

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
		
		boolean full_scr = params.full_scr
		
		if(full_scr & uec.hasErrors()){
			render(view: "edit_mail", model:[adm: true, user:user])
		} else {
			redirect(controller: "admin")
		}
	}
	
	private def getCategoryFiles(User user){
		def files = []
		
		File fileGeral = grailsAttributes.getApplicationContext().getResource("res/categories.csv").getFile()
		files += fileGeral
		
		files
	}
}
