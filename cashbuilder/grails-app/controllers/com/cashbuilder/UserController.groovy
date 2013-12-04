package com.cashbuilder

import com.cashbuilder.cmd.UserRegisterCommand;
import com.cashbuilder.cmd.UserEmailCommand;
import com.cashbuilder.cmd.UserPasswordCommand;
import com.cashbuilder.cmd.UserUpdateCommand;

class UserController {

	def generalService
    def userService
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
	
	def save(UserRegisterCommand urc) {
		
		if (!recaptchaService.verifyAnswer(session, request.getRemoteAddr(), params)) {
			generalService.buildMessage(Constants.MSG_ERROR,"form.signup.captcha.message.error")

		} else if(!userService.isEmailAvailable(urc.email)){
			generalService.buildMessage(Constants.MSG_ERROR,"form.signup.email.message.unavailable")

		} else {
			User nUser = userService.saveUser(urc)

			if(nUser == null || nUser.hasErrors()){
				generalService.buildMessage(Constants.MSG_ERROR,"form.signup.error.message")
				
			} else {
				def files = getCategoryFiles()
				userService.buildProfile(nUser,files)
				session.user = nUser

				redirect(controller: "home")
			}
		}

		render(view: "signup",model:[userInstance:urc,signup: true])
	}
	
	def update(UserUpdateCommand uuc) {
		def user = session.user.attach()

		if(!uuc.validate()){
			flash.errors = g.renderErrors(bean: uuc)
			generalService.buildMessage(Constants.MSG_ERROR,"form.edituser.data.error")

		} else{
			user.properties = uuc.properties
			user.profile.state = uuc.state
			user.profile.city = uuc.city
		
			session.user = user
			generalService.buildMessage(Constants.MSG_SUCCESS,"form.edituser.data.success")
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
					generalService.buildMessage(Constants.MSG_ERROR,"form.edituser.password.current.error")
				} else {
					user.password = Encoder.encode(upc.passwordNew)
					user.save(flush: true)
					session.user = user

					generalService.buildMessage(Constants.MSG_SUCCESS,"form.edituser.password.success")
				}
			}
		} else {
			flash.errors = g.renderErrors(bean: upc)
			generalService.buildMessage(Constants.MSG_ERROR,"form.edituser.password.error")
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
					generalService.buildMessage(Constants.MSG_ERROR,"form.edituser.mail.current.error")
					
				} else if(!userService.isEmailAvailable(uec.emailNew)){
					generalService.buildMessage(Constants.MSG_ERROR,"form.signup.email.error1.message")

				} else {
					user.email = uec.emailNew
					user.save(flush: true)
					session.user = user

					generalService.buildMessage(Constants.MSG_SUCCESS,"form.edituser.mail.success")
				}
			}
		} else {
			flash.errors = g.renderErrors(bean: uec)
			generalService.buildMessage(Constants.MSG_ERROR,"form.edituser.mail.error")
		}
		
		boolean full_scr = params.full_scr
		
		if(full_scr & uec.hasErrors()){
			render(view: "edit_mail", model:[adm: true, user:user])
		} else {
			redirect(controller: "admin")
		}
	}
	
	private def getCategoryFiles(){
		def files = []
		File fileGeral = grailsAttributes.getApplicationContext().getResource("res/categories.csv").getFile()
		files += fileGeral
		
		files
	}
}
