package com.cashbuilder

class LoginController {

	def userService
	def budgetService
	def eventService
	def transactionService
	def loginService
	def generalService
	
	static allowedMethods = [login: "POST"]

	def index() {
		
	}
	
	def login() {
		def user = userService.verifyLogin(params)
		
		if(user){
			def lastLogin = user.lastLogin
			user.lastLogin = new Date()
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

			if(loginService.isLoggedInPreviousMonth(lastLogin)){
				def budgetMonth = BudgetMonth.findByMonthAndBudget(DateUtils.currentMonth-1,budget)
				double balance = budgetService.getBalance(budgetMonth,user)

				if(balance > 0){
					transactionService.saveLastMonthBalance(user,balance)
					generalService.buildMessage(Constants.MSG_INFO,"alert.balance.updated.message")
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
