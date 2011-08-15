package com.cashbuilder

import com.cashbuilder.beans.BoxSaldoBean;
import com.cashbuilder.beans.orcamento.OrcamentoBean;
import com.cashbuilder.beans.orcamento.OrcamentoItemBean;
import com.cashbuilder.utils.Constants;
import com.cashbuilder.utils.DateUtils;

class OrcamentoController {

	def orcamentoService

	def scaffold = true

	def index = {

		if(!params.mesId){
			params.mesId = DateUtils.mesAtual
		}

		int iMes = Integer.valueOf(params.mesId)

		def user = session.user.attach()
		def orcamento = Orcamento.findByAnoAndUser(DateUtils.anoAtual,user)
		def mes = OrcmMes.findByMesAndOrcamento(iMes,orcamento)

		//form de filtro
		def meses = OrcmMes.findAllByOrcamento(orcamento)

		//orcamento detalhado
		OrcamentoBean orcamentoBean = new OrcamentoBean()
		orcamentoBean.ano =  orcamento.ano
		orcamentoBean.mes = DateUtils.getMes(mes.mes)

		//entradas
		List listEntradas = new ArrayList()

		def categoriasCred = Categoria.findAllByReceitaAndUser(true,user)

		categoriasCred.each { categoria ->
			OrcamentoItemBean OrcmCategoriaBean = new OrcamentoItemBean()
			OrcmCategoriaBean.nome = categoria.nome
			OrcmCategoriaBean.valorPrevisto = orcamentoService.getTotalPrevisto(mes,categoria)
			OrcmCategoriaBean.valorRealizado = orcamentoService.getTotalRealizado(mes,user,categoria)

			if(OrcmCategoriaBean.valorPrevisto > 0 || OrcmCategoriaBean.valorRealizado > 0){

				List listSubcategorias = new ArrayList()

				categoria.subcategorias.each { subcategoria ->

					OrcamentoItemBean OrcmSubcategoriaBean = new OrcamentoItemBean()
					OrcmSubcategoriaBean.nome = subcategoria.nome
					OrcmSubcategoriaBean.valorPrevisto = orcamentoService.getTotalPrevisto(mes,subcategoria)
					OrcmSubcategoriaBean.valorRealizado = orcamentoService.getTotalRealizado(mes,user,subcategoria)

					if(OrcmSubcategoriaBean.valorPrevisto > 0 || OrcmSubcategoriaBean.valorRealizado > 0){
						listSubcategorias.add OrcmSubcategoriaBean
					}
				}

				OrcmCategoriaBean.subcategorias = listSubcategorias
				listEntradas.add(OrcmCategoriaBean)
			}
		}

		//saida
		List listSaidas = new ArrayList()

		def categoriasDeb = Categoria.findAllByReceitaAndUser(false,user)

		categoriasDeb.each { categoria ->
			OrcamentoItemBean OrcmCategoriaBean = new OrcamentoItemBean()
			OrcmCategoriaBean.nome = categoria.nome
			OrcmCategoriaBean.valorPrevisto = orcamentoService.getTotalPrevisto(mes,categoria)
			OrcmCategoriaBean.valorRealizado = orcamentoService.getTotalRealizado(mes,user,categoria)

			if(OrcmCategoriaBean.valorPrevisto > 0 || OrcmCategoriaBean.valorRealizado > 0){

				List listSubcategorias = new ArrayList()

				categoria.subcategorias.each { subcategoria ->

					OrcamentoItemBean OrcmSubcategoriaBean = new OrcamentoItemBean()
					OrcmSubcategoriaBean.nome = subcategoria.nome
					OrcmSubcategoriaBean.valorPrevisto = orcamentoService.getTotalPrevisto(mes,subcategoria)
					OrcmSubcategoriaBean.valorRealizado = orcamentoService.getTotalRealizado(mes,user,subcategoria)

					if(OrcmSubcategoriaBean.valorPrevisto > 0 || OrcmSubcategoriaBean.valorRealizado > 0){
						listSubcategorias.add OrcmSubcategoriaBean
					}
				}

				OrcmCategoriaBean.subcategorias = listSubcategorias
				listSaidas.add(OrcmCategoriaBean)
			}
		}

		orcamentoBean.listaCredito = listEntradas
		orcamentoBean.listaDebito = listSaidas

		BoxSaldoBean box = new BoxSaldoBean()
		box.saldoPrevisto = orcamentoService.getSaldoPrevisto(mes)
		box.saldoRealizado = orcamentoService.getSaldoRealizado(mes,user)

		//Tipo de visualizacao
		if(!params.viewType){
			params.viewType = Constants.BASICO
		}

		[orcm: true, meses: meses, orcamento: orcamentoBean, boxSaldo: box]
	}
}
