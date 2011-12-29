package com.cashbuilder

import java.util.Date;

import com.cashbuilder.beans.relatorio.MultiBarChartDataBean;
import com.cashbuilder.beans.relatorio.PieChartDataBean;
import com.cashbuilder.utils.Constants;
import com.cashbuilder.utils.DateUtils;
import com.grailsfusioncharts.beans.MultiBarChartBean;
import com.grailsfusioncharts.beans.MultiLineChartBean;
import com.grailsfusioncharts.beans.PieChartBean;

class RelatorioController {

	def orcamentoService
	def geralService
	
    def index = {
		
		def user = session.user.attach()
		
		int mesAtual = DateUtils.mesAtual
		int anoAtual = DateUtils.anoAtual
		
		def orcamento = Orcamento.findByAnoAndUser(anoAtual,user)
		def mes = OrcmMes.findByMesAndOrcamento(mesAtual,orcamento)
		def categorias = Categoria.findAllByReceitaAndUser(false,user)
		
		//grafico de pizza
		def pieDataList = []
		
		categorias.each { categoria ->

			double totalRealizado = orcamentoService.getTotalRealizado(mes,user,categoria)
			
			if(totalRealizado > 0){
				PieChartDataBean bean = new PieChartDataBean(categoria: categoria.nome, total: totalRealizado)
				pieDataList += bean
			}
		}
		
		String pieData = PieChartBean.generateGraph(pieDataList)
		
		//Definicao de mes inicial e final
		int lastMonth = mesAtual
		int firstMonth = mesAtual >= 2? mesAtual-2 : 0;
		
		//grafico de barras
		def barDataList = []
		
		for(int idMes in firstMonth..lastMonth){
			def orcmMes = OrcmMes.findByMesAndOrcamento(idMes,orcamento)
			double entradas = orcamentoService.getTotalRealizado(orcmMes,user,Constants.CREDITO)
			double saidas = orcamentoService.getTotalRealizado(orcmMes,user,Constants.DEBITO)
			
			MultiBarChartDataBean bean = new MultiBarChartDataBean(mes:DateUtils.getMes(idMes),entradas:entradas,saidas:saidas)
			barDataList += bean
		}
		
		String barData = MultiBarChartBean.generateChart(barDataList)
		
		//grafico de linhas
		def lineDataList = []
		
		for(int idMes in firstMonth..lastMonth){
			def orcmMes = OrcmMes.findByMesAndOrcamento(idMes,orcamento)
			double entradas = orcamentoService.getTotalRealizado(orcmMes,user,Constants.CREDITO)
			double saidas = orcamentoService.getTotalRealizado(orcmMes,user,Constants.DEBITO)
			
			MultiBarChartDataBean bean = new MultiBarChartDataBean(mes:DateUtils.getMes(idMes),entradas:entradas,saidas:saidas)
			lineDataList += bean
		}

		String lineData = MultiLineChartBean.generateGraph(lineDataList)
		
		[stats:true, pieData: pieData, barData: barData, lineData: lineData]	
	}
}
