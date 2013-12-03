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
		boolean consult_mode = session.consult_year? true : false
		int currentMonth =  Integer.valueOf(params.monthId)
		int currentYear = session.consult_year?: year;

		//Definicao de mes inicial e final
		int lastMonth = currentMonth
		int firstMonth = currentMonth >= 2? currentMonth-2 : 0;		
		ReportBean report = reportService.buildBarChart(user, currentMonth, currentYear)
		ReportBean distribReport = reportService.buildExpendChart(user, currentMonth, currentYear)
				
		[stats:true, consult_mode: consult_mode, nextYear: nextYear, monthIndex: currentMonth, report: report,
			 distribReport: distribReport]
	}
	
	def reset_consult(){
		session.consult_year = null
		redirect(action:'index')
	}
}
