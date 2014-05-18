package com.cashbuilder

class LoginController {

	def userService
	def budgetService
	def eventService
	
	static allowedMethods = [login: "POST"]

	def index() {
		
	}
	
	def login() {
		def user = userService.verifyLogin(params)
		
		if(user){
			session.user = user
			def budget = Budget.findByYearAndUser(DateUtils.currentYear,user)

			if(!budget){
				budgetService.createNewBudget(user, DateUtils.currentYear)
				
			} else if(DateUtils.isLastMonthOfYear()){
				def budgetNextYear = Budget.findByYearAndUser(DateUtils.currentYear+1,user)
				
				if(!budgetNextYear){
					budgetService.createNewBudget(user, DateUtils.currentYear+1)
				}
			}

			eventService.checkEvents(user, null)
			redirect(controller:'home')
			
		}else{
			redirect(action:"loginFailed")
		}
	}
	
	def loginFailed() {
		[login: true]
	}
	
	def logoff() {
		session.user = null
		redirect(uri:"/")
	}
}
