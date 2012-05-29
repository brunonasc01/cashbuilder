package com.cashbuilder

import com.cashbuilder.cmd.UserCommand

class UserController {

	def scaffold = true
	
    def userService
	def expensesList = ["Animal de Estimacao","Carro ou Moto","Filho(s)"]
	
	static allowedMethods = [save: "POST"]
	
	def signup(){
		[expenses:expensesList]
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
		render(view: "signup",model:[userInstance:cmd,expenses:expensesList])
	}
	
	private def getCategoryFiles(User user){
		def files = []
		
		File fileGeral = grailsAttributes.getApplicationContext().getResource("res/categoriaGeral.csv").getFile()
		files += fileGeral
		def expensesFileMap = ["Animal de Estimacao":"res/categoriaMascote.csv","Carro ou Moto":"res/categoriaVeiculo.csv","Filho(s)":"res/categoriaFilho.csv"]

		user.profile.expenses.each { expense ->
			if(expense.enabled){
				String resourcePath = expensesFileMap.get(expense.name)
				File file = grailsAttributes.getApplicationContext().getResource(resourcePath).getFile()
				files += file
			}
		}
		
		files
	}
}
