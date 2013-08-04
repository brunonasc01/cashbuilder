package com.cashbuilder

import com.cashbuilder.beans.DateBean;
import com.cashbuilder.beans.relatorio.ReportDataBean;
import com.cashbuilder.beans.report.ReportBean;

class ReportService {
	
	static transactional = true

	def budgetService
	
    def serviceMethod() {

    }
	
	/**
	 * Monta as listas de dados para exibicao do grafico de barras
	 * @param user
	 * @param month
	 * @param year
	 * @return
	 */
	ReportBean buildBarChart(User user, int month, int year){

		def budget = Budget.findByYearAndUser(year,user)
		def budgetMonth = BudgetMonth.findByMonthAndBudget(month,budget)
		double total = budgetService.getRealizedTotal(budgetMonth,user,Constants.DEBITO)
		
		def reportData = []
		double maxValue = 0

		if(total > 0){			
			def categories = Category.findAllByIncomeAndUser(false,user)
			
			categories.each { category ->
				double categoryTotal = budgetService.getRealizedTotal(budgetMonth, user, category)
				
				if(categoryTotal > 0){
					ReportDataBean bean = new ReportDataBean()
					bean.total =  categoryTotal
					bean.label = category.name
					
					reportData += bean
					
					if(categoryTotal > maxValue){
						maxValue = categoryTotal
					}
				}
			}
			
			reportData.each { bean ->
				bean.percent = (bean.total/maxValue)*100
			}
		}
		
		ReportBean report = new ReportBean()
		report.date = new DateBean(year: year, month: DateUtils.getMonth(month))
		report.reportData = reportData
		report.reportScale = setReportScale(maxValue)
		
		report
	}
	
	/**
	 * Define as faixas de valor para o grafico de barras
	 * @param maxValue
	 * @return
	 */
	def setReportScale(double maxValue){
		def reportScale = []
		
		int top = Math.ceil(maxValue)
		int scale = top / 4
		
		for(int scaleValue = top; scaleValue >= 0;){
			reportScale += scaleValue
			scaleValue -= scale
		}
		reportScale[4] = 0
		
		reportScale
	}
}
