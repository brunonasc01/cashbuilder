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
				
		def user = session.user.attach()
		boolean consult_mode = session.consult_year? true : false
		int currentYear = session.consult_year?: year;

		def budget = Budget.findByYearAndUser(currentYear,user)

		def months = BudgetMonth.findAllByBudget(budget)
		def month = BudgetMonth.findByMonthAndBudget(currentMonth,budget)
						
		CashFlowBean cashflowBean = new CashFlowBean()
		cashflowBean.transactions = transactionService.getTransactions(user,currentMonth,currentYear)
		cashflowBean.date = new DateBean(year: currentYear, month: "month.${currentMonth}")
		
		BalanceBoxBean balanceBox = new BalanceBoxBean()
		balanceBox.title = "box.balance.title.total"
		balanceBox.income = budgetService.getRealizedTotal(month,user,Constants.CREDITO)
		balanceBox.expense = budgetService.getRealizedTotal(month,user,Constants.DEBITO)
		balanceBox.balanceClass = (balanceBox.balance >= 0) ? Constants.POSITIVE : Constants.NEGATIVE
		
		[cashflow: true, consult_mode: consult_mode, nextYear: nextYear, monthIndex: currentMonth, meses: months,
			 cashFlow:cashflowBean, balanceBox: balanceBox]
	}
	
	def reset_consult(){
		session.consult_year = null
		redirect(action:'index')
	}
}
