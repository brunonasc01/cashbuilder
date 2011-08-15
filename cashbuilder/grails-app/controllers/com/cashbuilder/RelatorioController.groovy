package com.cashbuilder

import com.cashbuilder.beans.relatorio.MultiBarChartDataBean;
import com.cashbuilder.beans.relatorio.PieChartDataBean;
import com.cashbuilder.utils.Constants;
import com.cashbuilder.utils.DateUtils;
import com.grailsfusioncharts.beans.MultiBarChartBean;
import com.grailsfusioncharts.beans.MultiLineChartBean;
import com.grailsfusioncharts.beans.PieChartBean;

class RelatorioController {

	def orcamentoService
	
    def index = {
		
		def user = session.user.attach()
		
		int mesAtual = DateUtils.mesAtual
		int anoAtual = DateUtils.anoAtual
		
		def orcamento = Orcamento.findByAnoAndUser(anoAtual,user)
		def mes = OrcmMes.findByMesAndOrcamento(mesAtual,orcamento)
		def categorias = Categoria.findAllByReceitaAndUser(false,user)
		
		//grafico de pizza
		def pieDataList = new ArrayList()
		
		categorias.each { categoria ->

			double totalRealizado = orcamentoService.getTotalRealizado(mes,user,categoria)
			
			if(totalRealizado > 0){
				PieChartDataBean bean = new PieChartDataBean(categoria: categoria.nome, total: totalRealizado)
				pieDataList.add bean
			}
		}
		
		String pieData = PieChartBean.generateGraph(pieDataList)
		
		
		//grafico de barras
		def barDataList = new ArrayList()
		
		for(int idMes in mesAtual-1..mesAtual+1){
			def orcmMes = OrcmMes.findByMesAndOrcamento(idMes,orcamento)
			double entradas = orcamentoService.getTotalRealizado(orcmMes,user,Constants.CREDITO)
			double saidas = orcamentoService.getTotalRealizado(orcmMes,user,Constants.DEBITO)
			
			MultiBarChartDataBean bean = new MultiBarChartDataBean(mes:DateUtils.getMes(idMes),entradas:entradas,saidas:saidas)
			barDataList.add bean
		}
		
		String barData = MultiBarChartBean.generateChart(barDataList)
		
		String lineData = MultiLineChartBean.generateGraph(barDataList)
		
		[stats:true, pieData: pieData, barData: barData, lineData: lineData]	
	}
}
