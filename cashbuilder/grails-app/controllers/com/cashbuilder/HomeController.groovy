package com.cashbuilder

import com.cashbuilder.beans.BalanceBoxBean;

class HomeController {

	def budgetService
	def generalService
	def transactionService
	
	static allowedMethods = [save_registro: "POST"]
	
    def index() {
		
		def user = session.user.attach()

		def budget = Budget.findByYearAndUser(DateUtils.currentYear,user)
		def budgetMonth = BudgetMonth.findByMonthAndBudget(DateUtils.currentMonth,budget)

		//box saldo
		BalanceBoxBean balanceBox = new BalanceBoxBean();
		balanceBox.title = "box.balance.title1"
		balanceBox.income = budgetService.getRealizedTotal(budgetMonth,user,Constants.CREDITO)
		balanceBox.expense = budgetService.getRealizedTotal(budgetMonth,user,Constants.DEBITO)		
		balanceBox.balanceClass = (balanceBox.balance >= 0) ? Constants.POSITIVE : Constants.NEGATIVE
		
		//box ultimos registro
		def c =  Transaction.createCriteria()
		
		def ultimosRegistros = c.list(max:4) {
			eq('user', user)
			order("id", "desc")
		}

		def categoriesList = generalService.getCategoriesList(user)
		def alerts = Alert.findAllByBudget(budget)
		
		[home: true, balanceBox: balanceBox, ultimosRegistros: ultimosRegistros, registroRapido: categoriesList, alerts: alerts]
	}
	
	def saveTransaction() {

		def user = session.user.attach()
		def transaction = transactionService.saveTransaction(user, params)
		
		if(transaction.hasErrors()){
			render(view: "index",model:[transaction:transaction])
		} else {
			redirect(action: "index")
		}
	}
}
