package com.cashbuilder

import com.cashbuilder.beans.relatorio.GraphDataBean;
import com.cashbuilder.beans.relatorio.MultiBarChartDataBean;
import com.cashbuilder.beans.relatorio.PieChartDataBean;
import com.grailsfusioncharts.beans.Column3dChartBean;
import com.grailsfusioncharts.beans.MultiBarChartBean;
import com.grailsfusioncharts.beans.PieChartBean;

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
		
		//grafico de pizza
		def pieDataList = []
		def columnDataList = []
		
		categories.each { category ->
			double realizedTotal = budgetService.getRealizedTotal(month, user, category)
			
			if(realizedTotal > 0){
				PieChartDataBean bean = new PieChartDataBean(categoria: category.name, total: realizedTotal)
				pieDataList += bean
				
				GraphDataBean dataBean = new GraphDataBean(name: category.name, value: realizedTotal)
				columnDataList += dataBean
			}
		}
		
		emptyReport = columnDataList.size() == 0 || pieDataList.size() == 0

		String columnData = Column3dChartBean.generateGraph(columnDataList)
		String pieData = PieChartBean.generateGraph(pieDataList)
		
		//Definicao de mes inicial e final
		int lastMonth = currentMonth
		int firstMonth = currentMonth >= 2? currentMonth-2 : 0;
		
		//grafico de barras
		def barDataList = []
		
		for(int monthId in firstMonth..lastMonth){
			def budgetMonth = BudgetMonth.findByMonthAndBudget(monthId,budget)
			double entradas = budgetService.getRealizedTotal(budgetMonth,user,Constants.CREDITO)
			double saidas = budgetService.getRealizedTotal(budgetMonth,user,Constants.DEBITO)
			
			MultiBarChartDataBean bean = new MultiBarChartDataBean(mes:g.message(code:DateUtils.getMonth(monthId)),entradas:entradas,saidas:saidas)
			barDataList += bean
		}
		
		String barData = MultiBarChartBean.generateChart(barDataList)
		
		[stats:true, nextYear: nextYear, monthIndex: currentMonth, emptyReport: emptyReport, pieData: pieData, columnData: columnData, barData: barData]
	}
}
