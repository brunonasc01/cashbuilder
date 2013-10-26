package com.cashbuilder

import com.cashbuilder.beans.BalanceBoxBean;

class AdminController {

	def budgetService
	def generalService
	
	static allowedMethods = [save_budget: "POST", consult_legacy:"POST"]
	
    def index() {
		
		def user = session.user.attach()
		boolean consult_mode = session.consult_year? true : false
		def yearsList = []
		
		if(!consult_mode) {
			def budgets = Budget.findAllByUser(user)
			int year = DateUtils.currentYear
			
			budgets.each { budget ->
				if(budget.year != year){
					yearsList += budget.year
				}
			} 
		}
		
		[adm: true, consult_mode: consult_mode, yearsList: yearsList]
	}
	
	def manage_budget() {
		
		int year = DateUtils.currentYear
		boolean nextYear = false
		
		if(params.nextYear){
			year = year+1
			nextYear = true
		}
		
		if(!params.monthId){
			params.monthId = DateUtils.currentMonth
		}
		
		int iMonth = Integer.valueOf(params.monthId)

		def user = session.user.attach()
		def budget = Budget.findByYearAndUser(year,user)
		def month = BudgetMonth.findByMonthAndBudget(iMonth,budget)

		def months = BudgetMonth.findAllByBudget(budget)
		def expenseList = budgetService.getBudgetItems(user,iMonth,year,false)
		def incomeList = budgetService.getBudgetItems(user,iMonth,year,true)
		def df = generalService.getNumberFormatter()

		BalanceBoxBean balanceBox = new BalanceBoxBean()
		balanceBox.title = "box.balance.title4"
		balanceBox.income = budgetService.getBudgetedTotal(month,true)
		balanceBox.expense = budgetService.getBudgetedTotal(month,false)
		balanceBox.balanceClass = (balanceBox.balance >= 0) ? Constants.POSITIVE : Constants.NEGATIVE 
		
		[ adm: true, df: df, monthIndex: iMonth, expenseList: expenseList, incomeList: incomeList, budgetMonth: month,
			 months: months, balanceBox: balanceBox, currentYear: year, nextYear: nextYear]
	}
	
	def save_budget() {
		
		def user = session.user.attach()
		def saveType = params.saveType
		
		budgetService.saveFullBudget(user, saveType, params)

		if(saveType.equals("year")){
			generalService.buildMessage(Constants.MSG_SUCCESS,"Orcamento para o Ano Salvo com Sucesso")
		}else{
			generalService.buildMessage(Constants.MSG_SUCCESS,"Orcamento para o Mes Salvo com Sucesso.")
		}

		redirect(action:'manage_budget', params: [monthId: params.monthId])
	}
	
	def consult_legacy() {
		if(params.consult_year){
			int _year = params.consult_year as Integer
			session.consult_year = _year 
		}
		
		redirect(action:'index')
	}
	
	def reset_consult(){
		session.consult_year = null
		
		redirect(action:'index')
	}
}
