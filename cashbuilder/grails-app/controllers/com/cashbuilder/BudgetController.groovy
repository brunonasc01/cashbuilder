package com.cashbuilder

import com.cashbuilder.beans.BalanceBoxBean;
import com.cashbuilder.beans.DateBean;
import com.cashbuilder.budget.BudgetBean;

class BudgetController {

	def budgetService
	def generalService
	
    def index() {
		
		int year = DateUtils.currentYear
		boolean nextYear = false
		
		if(params.nextYear){
			year = year+1
			nextYear = true
		}
	
		if(!params.monthId){
			params.monthId = DateUtils.currentMonth
		}

		int month = Integer.valueOf(params.monthId)
		def user = session.user.attach()
		boolean consult_mode = session.consult_year? true : false
		int currentYear = session.consult_year?: year;
		
		def budget = Budget.findByYearAndUser(currentYear,user)
		def budgetMonth = BudgetMonth.findByMonthAndBudget(month,budget)

		//Calculo do saldo de protecao
//		if(budgetMonth.protectionBalance <= 0){
//			def protectBalance = budgetService.getProtectionBalance(budgetMonth,user)
//
//			if(protectBalance > 0){
//				budgetMonth.protectionBalance = protectBalance
//			}
//		}
		
		def months = BudgetMonth.findAllByBudget(budget)

		def listEntradas = budgetService.getBudgetData(user, budgetMonth, true)
		def listSaidas = budgetService.getBudgetData(user, budgetMonth, false)
		
		BudgetBean budgetBean = new BudgetBean()
		budgetBean.date = new DateBean(year: budget.year, month: "month.${budgetMonth.month}")
		budgetBean.incomeList = listEntradas
		budgetBean.expenseList = listSaidas

		BalanceBoxBean balanceBox = new BalanceBoxBean(isBudget:true)
		balanceBox.title = "box.balance.title.balance"
		balanceBox.plannedBalance = budgetService.getBudgetedBalance(budgetMonth)
		balanceBox.actualBalance = budgetService.getBalance(budgetMonth,user)
		balanceBox.plannedClass = (balanceBox.plannedBalance >= 0) ? Constants.POSITIVE : Constants.NEGATIVE
		balanceBox.actualClass = (balanceBox.actualBalance >= 0) ? Constants.POSITIVE : Constants.NEGATIVE
		//balanceBox.protectionBalance = budgetMonth.protectionBalance 

		def df = generalService.getNumberFormatter()
		
		[budget: true, consult_mode: consult_mode, nextYear: nextYear, monthIndex: month, meses: months,
			 budget: budgetBean, balanceBox: balanceBox, df: df]
	}
	
	def reset_consult(){
		session.consult_year = null
		redirect(action:'index')
	}
}
