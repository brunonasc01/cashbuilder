package com.cashbuilder

import org.joda.time.LocalDateTime;

import com.cashbuilder.beans.BalanceBoxBean;

class HomeController {

	def budgetService
	def generalService
	def transactionService
	def eventService

	static allowedMethods = [saveTransaction: "POST"]
	
    def index() {
		
		def user = session.user.attach()
		boolean consult_mode = session.consult_year? true : false

		int currentYear = session.consult_year?: DateUtils.currentYear;
		
		def budget = Budget.findByYearAndUser(currentYear,user)
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
		
		//box transacoes futuras
		LocalDateTime ldt = new LocalDateTime()
		c =  Transaction.createCriteria()

		def registrosFuturos = c.list(max:4) {
			eq('user', user)
			between('date', ldt.plusDays(1).toDate(), ldt.plusMonths(1).toDate())
			order("date", "desc")
		}

		def categoriesList = generalService.getCategoriesList(user)
		def alerts = Alert.findAllByBudgetAndEnable(budget,true)
		
		[home: true, consult_mode: consult_mode, balanceBox: balanceBox, ultimosRegistros: ultimosRegistros, registrosFuturos: registrosFuturos, registroRapido: categoriesList, alerts: alerts]
	}
	
	def saveTransaction() {

		def user = session.user.attach()
		def transaction = transactionService.saveTransaction(user, params)
		
		if(transaction.hasErrors()){
			flash.errors = g.renderErrors(bean: transaction)
			generalService.buildMessage(Constants.MSG_ERROR,"transaction.data.invalid")
		} else {
			eventService.processAlerts(user)
			generalService.buildMessage(Constants.MSG_SUCCESS,"transaction.data.success")
		}
		
		redirect(action: "index")
	}
	
	def reset_consult(){
		session.consult_year = null
		
		redirect(action:'index')
	}
}
