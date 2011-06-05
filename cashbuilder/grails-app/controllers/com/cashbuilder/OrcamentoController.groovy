package com.cashbuilder

import com.cashbuilder.beans.CategoriaBean;

import java.util.Calendar;

import com.cashbuilder.beans.OrcmBean;

class OrcamentoController {

	def orcamentoService
	
	def scaffold = true
	
    def index = {

		def user = session.user.attach()
		def orcamento = Orcamento.findByAnoAndUser(Calendar.getInstance().get(Calendar.YEAR),user)
		def mes = OrcmMes.findByMesAndOrcamento(Calendar.getInstance().get(Calendar.MONTH),orcamento)
		
		List<CategoriaBean> listCategorias = new ArrayList<CategoriaBean>()
		def allCategorias = Categoria.findAllByUser(user)
		
		allCategorias.each { categoria ->
			
			double vlMax = orcamentoService.calcTotalPrevCategoria(mes,categoria)
			double vlReal = orcamentoService.calcTotalRealCategoria(mes,categoria)
			double percent = vlReal / vlMax
			
			listCategorias.add(new CategoriaBean(categoria:categoria.nome,vlPrevisto:vlMax,
				vlRealizado:vlReal,percentual:percent))
		}

		OrcmBean result = new OrcmBean(ano:orcamento.ano,mes:mes.mes,items:listCategorias) 
				
		[result : result]
	}
}
