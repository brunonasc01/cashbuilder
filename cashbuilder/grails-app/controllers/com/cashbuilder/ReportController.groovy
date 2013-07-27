package com.cashbuilder

import com.cashbuilder.beans.DateBean;
import com.cashbuilder.beans.relatorio.ReportDataBean;
import com.cashbuilder.beans.report.ReportBean;

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
			double greaterCategory = 0
			
			categories.each { category ->
				double categoryTotal = budgetService.getRealizedTotal(month, user, category)
				
				if(categoryTotal > 0){
					ReportDataBean bean = new ReportDataBean()
					bean.total =  categoryTotal
					bean.label = category.name
					
					reportData += bean
					
					if(categoryTotal > greaterCategory){
						greaterCategory = categoryTotal
					}
				}
			}
			
			reportData.each { bean -> 
				bean.percent = (bean.total/greaterCategory)*100
			}
			
			double scale = greaterCategory / 4

			for(double scaleValue=greaterCategory; scaleValue >= 0;){
				reportScale += scaleValue
				scaleValue -= scale
			}
		}

		//Definicao de mes inicial e final
		int lastMonth = currentMonth
		int firstMonth = currentMonth >= 2? currentMonth-2 : 0;
		
		ReportBean report = new ReportBean()
		
		report.date = new DateBean(year: currentYear, month: DateUtils.getMonth(currentMonth))
		report.reportData = reportData
		report.reportScale = reportScale
		
		char labelReference = 'A'
				
		[stats:true, nextYear: nextYear, monthIndex: currentMonth, report: report, labelReference:labelReference]
	}
}
