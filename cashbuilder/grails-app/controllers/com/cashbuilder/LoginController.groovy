package com.cashbuilder

class LoginController {

	def userService
	def budgetService
	def eventService
	
	static allowedMethods = [validate_access: "POST"]

	def login = {
		def user = userService.verifyLogin(params)
		
		if(user){
			session.user = user
			def budget = Budget.findByYearAndUser(DateUtils.currentYear,user)

			if(!budget){
				budgetService.createNewBudget(user, DateUtils.currentYear)
			}

			eventService.checkEvents(user, null)
			redirect(controller:'home')
			
		}else{
			flash.message = "Usuario ou Senha invalidos"
			redirect(uri:"/")
		}
	}
	
	def logoff = {
		session.user = null
		redirect(uri:"/")
	}
}
