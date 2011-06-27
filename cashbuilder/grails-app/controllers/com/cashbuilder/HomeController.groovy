package com.cashbuilder

import com.cashbuilder.beans.BoxRegRapidoBean;
import com.cashbuilder.beans.BoxSaldoBean;

class HomeController {

	def fluxocaixaService
	
    def index = {
		
		def user = session.user.attach()
		def orcamento = Orcamento.findByAnoAndUser(Calendar.getInstance().get(Calendar.YEAR),user)
		def mes = OrcmMes.findByMesAndOrcamento(Calendar.getInstance().get(Calendar.MONTH),orcamento)
		
		
		//box saldo
		BoxSaldoBean boxSaldo = new BoxSaldoBean();
		boxSaldo.entradas = fluxocaixaService.calcTotal(mes,user,true)
		boxSaldo.saidas = fluxocaixaService.calcTotal(mes,user,false)		
		boxSaldo.saldo = boxSaldo.entradas - boxSaldo.saidas
		
		//box ultimos pagamentos
		def ultimosRegistros = Pagamento.search("*",[max: 5, sort:'data', order:'desc'])
		
		//box registro rapido
		def allCategorias = Categoria.findAllByUser(user)
		List allSubcategoria = new ArrayList()

		allCategorias.each { categoria ->
			def subcategorias = Subcategoria.findAllByCategoria(categoria)
			allSubcategoria.addAll(subcategorias)
		}

		BoxRegRapidoBean registroRapido = new BoxRegRapidoBean(categorias:allCategorias, subcategorias:allSubcategoria)
		
		[home: true, boxSaldo : boxSaldo, ultimosRegistros : ultimosRegistros, registroRapido : registroRapido]
	}
	
	def save_registro = {
		
		def pagamento = new Pagamento(params)

		def user = session.user.attach()
		pagamento.user = user
		
		if(!pagamento.hasErrors()){
			pagamento.save(flush:true)
		}

		redirect(action: "index")
	}
}
