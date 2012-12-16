package com.cashbuilder

import com.cashbuilder.beans.BalanceBoxBean;
import com.cashbuilder.beans.DateBean;
import com.cashbuilder.cashflow.CashFlowBean;

class CashflowController {

	def transactionService
	def budgetService
	
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
		
		int currentMonth = Integer.valueOf(params.monthId)
		int currentYear = year
		
		def user = session.user.attach()
		def budget = Budget.findByYearAndUser(currentYear,user)

		def months = BudgetMonth.findAllByBudget(budget)
		def month = BudgetMonth.findByMonthAndBudget(currentMonth,budget)
						
		CashFlowBean cashflowBean = new CashFlowBean()
		cashflowBean.transactions = transactionService.getTransactions(user,currentMonth,currentYear)
		cashflowBean.date = new DateBean(year: currentYear, month: DateUtils.getMonth(currentMonth))
		
		BalanceBoxBean balanceBox = new BalanceBoxBean()
		balanceBox.title = "box.balance.title2"
		balanceBox.income = budgetService.getRealizedTotal(month,user,Constants.CREDITO)
		balanceBox.expense = budgetService.getRealizedTotal(month,user,Constants.DEBITO)
		balanceBox.balanceClass = (balanceBox.balance >= 0) ? Constants.POSITIVE : Constants.NEGATIVE
		
		[cashflow: true, nextYear: nextYear, monthIndex: currentMonth, meses: months, cashFlow:cashflowBean, balanceBox: balanceBox]
	}
}
