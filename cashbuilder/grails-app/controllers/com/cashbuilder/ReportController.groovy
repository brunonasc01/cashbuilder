package com.cashbuilder

import com.cashbuilder.beans.report.ReportBean;

class ReportController {

	def reportService
	
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

		//Definicao de mes inicial e final
		int lastMonth = currentMonth
		int firstMonth = currentMonth >= 2? currentMonth-2 : 0;
		
		ReportBean report = reportService.buildBarChart(user, currentMonth, currentYear)
		char labelReference = 'A'
				
		[stats:true, nextYear: nextYear, monthIndex: currentMonth, report: report, labelReference:labelReference]
	}
}
