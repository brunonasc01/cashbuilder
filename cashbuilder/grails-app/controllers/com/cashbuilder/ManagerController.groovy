package com.cashbuilder

import com.cashbuilder.beans.BalanceBoxBean;

class ManagerController {

	def budgetService
	def generalService
	
	static allowedMethods = [save_budget: "POST"]
	
    def index() {
		[adm: true]
	}
	
	def manage_budget() {
		
		if(!params.monthId){
			params.monthId = DateUtils.currentMonth
		}
		
		int iMonth = Integer.valueOf(params.monthId)

		def user = session.user.attach()
		def budget = Budget.findByYearAndUser(DateUtils.currentYear,user)
		def month = BudgetMonth.findByMonthAndBudget(iMonth,budget)

		def months = BudgetMonth.findAllByBudget(budget)
		def expenseList = budgetService.getBudgetItems(user,iMonth,false)
		def incomeList = budgetService.getBudgetItems(user,iMonth,true)
		def df = generalService.getNumberFormatter()

		BalanceBoxBean balanceBox = new BalanceBoxBean()
		balanceBox.title = "box.balance.title4"
		balanceBox.income = budgetService.getBudgetedTotal(month,true)
		balanceBox.expense = budgetService.getBudgetedTotal(month,false)
		balanceBox.balanceClass = (balanceBox.balance >= 0) ? Constants.POSITIVE : Constants.NEGATIVE 
		
		[ adm: true, df: df, monthIndex: iMonth, expenseList: expenseList, incomeList: incomeList, budgetMonth: month, months: months, balanceBox: balanceBox]
	}
	
	def save_budget() {
		
		def user = session.user.attach()
		def saveType = params.saveType
		
		budgetService.saveFullBudget(user, saveType, params)

		if(saveType.equals("year")){
			flash.message = "Orcamento para o Ano Salvo com Sucesso."
		}else{
			flash.message = "Orcamento para o Mes Salvo com Sucesso."
		}

		redirect(action:'manage_budget', params: [monthId: params.monthId])
	}
}
