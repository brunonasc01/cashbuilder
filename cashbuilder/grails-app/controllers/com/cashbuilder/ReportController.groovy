package com.cashbuilder

import com.cashbuilder.beans.relatorio.ReportDataBean;

class ReportController {

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
		
		boolean emptyReport=false
		
		def user = session.user.attach()
		
		int currentMonth =  Integer.valueOf(params.monthId)
		int currentYear = year
		
		def budget = Budget.findByYearAndUser(currentYear,user)
		def month = BudgetMonth.findByMonthAndBudget(currentMonth,budget)
		def categories = Category.findAllByIncomeAndUser(false,user)
		
		//grafico com css3
		
		def reportData = []
		def reportScale = []
		double total = budgetService.getRealizedTotal(month,user,Constants.DEBITO)
		
		if(total > 0){
			categories.each { category ->
				double categoryTotal = budgetService.getRealizedTotal(month, user, category)
				
				if(categoryTotal > 0){
					ReportDataBean bean = new ReportDataBean()
					bean.total =  categoryTotal
					bean.percent = (categoryTotal/total)*100
					bean.label = category.name
					
					reportData += bean
				}
			}
			
			double scale = total / 4

			for(double scaleValue=total; scaleValue >= 0;){
				reportScale += scaleValue
				scaleValue -= scale
			}
		}
		
		emptyReport = reportData.size() == 0
		
		//Definicao de mes inicial e final
		int lastMonth = currentMonth
		int firstMonth = currentMonth >= 2? currentMonth-2 : 0;
				
		[stats:true, nextYear: nextYear, monthIndex: currentMonth, emptyReport: emptyReport, reportData: reportData, reportScale: reportScale]
	}
}
