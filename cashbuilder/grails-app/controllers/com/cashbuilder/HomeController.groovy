package com.cashbuilder

import com.cashbuilder.beans.BalanceBoxBean;

class HomeController {

	def budgetService
	def generalService
	def transactionService

	static allowedMethods = [saveTransaction: "POST"]
	
    def index() {
		
		def user = session.user.attach()

		def budget = Budget.findByYearAndUser(DateUtils.currentYear,user)
		def budgetMonth = BudgetMonth.findByMonthAndBudget(DateUtils.currentMonth,budget)

		//box saldo
		BalanceBoxBean balanceBox = new BalanceBoxBean();
		balanceBox.title = "box.balance.title1"
		balanceBox.income = budgetService.getRealizedTotal(budgetMonth,user,Constants.CREDITO)		
		balanceBox.expense = budgetService.getRealizedTotal(budgetMonth,user,Constants.DEBITO)
		balanceBox.plannedIncome = budgetService.getBudgetedTotal(budgetMonth,true)
		balanceBox.plannedExpense = budgetService.getBudgetedTotal(budgetMonth,false)
				
		balanceBox.balanceClass = (balanceBox.balance >= 0) ? Constants.POSITIVE : Constants.NEGATIVE
		
		//box ultimos registro
		def c =  Transaction.createCriteria()
		
		def ultimosRegistros = c.list(max:4) {
			eq('user', user)
			order("id", "desc")
		}

		def categoriesList = generalService.getCategoriesList(user)
		def alerts = Alert.findAllByBudgetAndEnable(budget,true)
		
		[home: true, balanceBox: balanceBox, ultimosRegistros: ultimosRegistros, registroRapido: categoriesList, alerts: alerts]
	}
	
	def saveTransaction() {

		def user = session.user.attach()
		def transaction = transactionService.saveTransaction(user, params)
		
		if(transaction.hasErrors()){
			flash.message = g.renderErrors(bean: transaction)
		} 
		
		redirect(action: "index")
	}
}
