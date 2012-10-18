package com.cashbuilder

import com.cashbuilder.beans.BalanceBoxBean;
import com.cashbuilder.beans.ContactSubjectBean;

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
		def alerts = Alert.findAllByBudget(budget)
		
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
	
	def about() {
		
	}
	
	def contact() {
		def subjects = []
		
		subjects += new ContactSubjectBean(id: "sugestion", value: g.message(code:"contact.subject1"))
		subjects += new ContactSubjectBean(id: "error", value: g.message(code:"contact.subject2"))
		subjects += new ContactSubjectBean(id: "interface", value: g.message(code:"contact.subject3"))
		subjects += new ContactSubjectBean(id: "others", value: g.message(code:"contact.subject4"))
		
		[subjects : subjects]
	}
	
	def submitContact(){
		//TODO implementar
		
		redirect(uri:"/")
	}
}
