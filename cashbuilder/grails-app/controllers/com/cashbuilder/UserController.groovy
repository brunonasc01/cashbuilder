package com.cashbuilder

import com.cashbuilder.cmd.UserCommand
import com.cashbuilder.cmd.UserEmailCommand;
import com.cashbuilder.cmd.UserPasswordCommand;

class UserController {

    def userService
	def expensesList = ["Animal de Estimacao","Carro ou Moto","Filho(s)"]
	
	static allowedMethods = [save: "POST", update: "POST", updatePassword:"POST", updateMail:"POST"]
	
	def signup(){
		[signup: true]
	}
	
	def edit() {
		def user = session.user.attach()

		[adm: true, user: user]
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
		
		if(cmd.validate()){
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
				flash.message = "form.signup.email.error1.message"
			}
		}

		render(view: "signup",model:[userInstance:cmd,signup: true])
	}
	
	def update() {		
		def user = User.get(params.id)
		user.properties = params
		
		if(!user.validate()){
			user.profile.validate()
			
			render(view: "edit",model:[user:user])
		} else{
			session.user = user
			flash.message = "Usuario atualizado com sucesso"
			redirect(controller: "manager")
		}
	}
	
	def updatePassword(UserPasswordCommand upc) {
		
		if(upc.validate()){
			def user = User.get(upc.id)

			if(user) {			
				String oldPassword = Encoder.encode(upc.password)
												
				if(!user.password.equals(oldPassword)){
					flash.message = "A senha atual esta incorreta"
					render(view: "edit_password", model: [user: user])
				} else {
					user.password = Encoder.encode(upc.passwordNew)
					user.save(flush: true)
					session.user = user

					flash.message = "Senha atualizada com sucesso"
					redirect(controller: "manager")
				}
			}
		} else {
			render(view: "edit_password", model: [user: upc])
		}
	}
	
	def updateMail(UserEmailCommand uec){
		
		if(uec.validate()){
			def user = User.get(uec.id)

			if(user){
				if(user.email != uec.email){
					flash.message = "O e-mail atual esta incorreto"
					render(view: "edit_mail", model: [user: user])
				} else if(!userService.isEmailAvailable(uec.emailNew)){
					flash.message = "form.signup.email.error1.message"
					render(view: "edit_mail", model: [user: user])
				} else {
					user.email = uec.emailNew
					user.save(flush: true)
					session.user = user
					
					flash.message = "E-Mail atualizado com sucesso"
					redirect(controller: "manager")
				}
			}
		} else {
			render(view: "edit_mail", model: [user: uec])
		}
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
