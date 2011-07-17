package com.cashbuilder

import com.cashbuilder.beans.CategoriaBean;
import com.cashbuilder.beans.OrcamentoDetalhadoBean;
import com.cashbuilder.beans.OrcmDetalhadoItemBean;

import java.util.Calendar;

import com.cashbuilder.beans.OrcmBean;
import com.cashbuilder.beans.orcamento.OrcamentoBoxSaldoBean;
import com.cashbuilder.utils.Constants;
import com.cashbuilder.utils.DateUtils;

class OrcamentoController {

	def orcamentoService
	
	def scaffold = true
	
    def index = {

		if(!params.mesId || !params.anoId){
			params.mesId = DateUtils.currentMonth
			params.anoId = DateUtils.currentYear
		}
		
		int iMes = Integer.valueOf(params.mesId)
		int iAno = Integer.valueOf(params.anoId)
		
		def user = session.user.attach()
		def orcamento = Orcamento.findByAnoAndUser(iAno,user)
		def mes = OrcmMes.findByMesAndOrcamento(iMes,orcamento)
		
		
		//form de filtro
		def orcamentos = Orcamento.findAllByUser(user)
		def meses = OrcmMes.findAllByOrcamento(orcamento)
		
		//orcamento detalhado
		OrcamentoDetalhadoBean orcmBean = new OrcamentoDetalhadoBean()
		orcmBean.ano = orcamento.ano
		orcmBean.mes = mes.mes
		
		//entradas
		List lsEntradas = new ArrayList()
		
		def categoriasCred = Categoria.findAllByReceitaAndUser(true,user)
		
		categoriasCred.each { categoria ->
			OrcmDetalhadoItemBean bean = new OrcmDetalhadoItemBean()
			bean.nome = categoria.nome
			bean.vlPrevisto = orcamentoService.calcTotalPrevCategoria(mes,categoria)
			bean.vlRealizado = orcamentoService.calcTotalRealCategoria(mes,categoria)
			
			if(bean.vlPrevisto > 0 || bean.vlRealizado > 0){

				List lsSubCategorias = new ArrayList()

				categoria.subcategorias.each { subcategoria ->

					OrcmDetalhadoItemBean sBean = new OrcmDetalhadoItemBean()
					sBean.nome = subcategoria.nome
					sBean.vlPrevisto = orcamentoService.calcTotalPrevSubcategoria(mes,subcategoria)
					sBean.vlRealizado = orcamentoService.calcTotalRealSubcategoria(mes,subcategoria)

					if(sBean.vlPrevisto > 0 || sBean.vlRealizado > 0){
						lsSubCategorias.add sBean
					}
				}

				bean.subcategorias = lsSubCategorias

				
				lsEntradas.add(bean)
			}
		}
		
		//saida
		List lsSaidas = new ArrayList()
		
		def categoriasDeb = Categoria.findAllByReceitaAndUser(false,user)
		
		categoriasDeb.each { categoria ->
			OrcmDetalhadoItemBean bean = new OrcmDetalhadoItemBean()
			bean.nome = categoria.nome
			bean.vlPrevisto = orcamentoService.calcTotalPrevCategoria(mes,categoria)
			bean.vlRealizado = orcamentoService.calcTotalRealCategoria(mes,categoria)
			
			if(bean.vlPrevisto > 0 || bean.vlRealizado > 0){

				List lsSubCategorias = new ArrayList()

				categoria.subcategorias.each { subcategoria ->

					OrcmDetalhadoItemBean sBean = new OrcmDetalhadoItemBean()
					sBean.nome = subcategoria.nome
					sBean.vlPrevisto = orcamentoService.calcTotalPrevSubcategoria(mes,subcategoria)
					sBean.vlRealizado = orcamentoService.calcTotalRealSubcategoria(mes,subcategoria)

					if(sBean.vlPrevisto > 0 || sBean.vlRealizado > 0){
						lsSubCategorias.add sBean
					}
				}

				bean.subcategorias = lsSubCategorias

				lsSaidas.add(bean)
			}
		}

		orcmBean.orcmEntradas = lsEntradas
		orcmBean.orcmSaidas = lsSaidas
		
		OrcamentoBoxSaldoBean box = new OrcamentoBoxSaldoBean()
		
		box.saldoPrevisto = orcamentoService.calcSaldoPrevisto(mes)
		box.saldoRealizado = orcamentoService.calcSaldoRealizado(mes)
		
		//Tipo de visualizacao
		if(!params.viewType){
			params.viewType = Constants.BASIC
		}
		
		[orcm : true, anos : orcamentos, meses : meses, orcamento : orcmBean, boxSaldo: box]
	}
}
