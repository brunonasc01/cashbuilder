package com.cashbuilder

import com.cashbuilder.beans.BoxRegRapidoBean;
import com.cashbuilder.beans.BoxSaldoBean;
import com.cashbuilder.utils.Constants;
import com.cashbuilder.utils.DateUtils;

class HomeController {

	def orcamentoService
	
    def index = {
		
		def user = session.user.attach()

		def orcamento = Orcamento.findByAnoAndUser(DateUtils.anoAtual,user)
		def mesAtual = OrcmMes.findByMesAndOrcamento(DateUtils.mesAtual,orcamento)

		//box saldo
		BoxSaldoBean boxSaldo = new BoxSaldoBean();
		boxSaldo.entradas = orcamentoService.getTotalRealizado(mesAtual,user,Constants.CREDITO)
		boxSaldo.saidas = orcamentoService.getTotalRealizado(mesAtual,user,Constants.DEBITO)		
		
		//box ultimos registro
		def ultimosRegistros = Pagamento.createCriteria().list(max:3) {
			eq('user', user)
			order("id", "desc")
		}
		
		//box registro rapido
		def allCategorias = Categoria.findAllByUser(user)
		def allSubcategorias = Subcategoria.createCriteria().list{
			'in'('categoria', allCategorias)
		}

		BoxRegRapidoBean registroRapido = new BoxRegRapidoBean(categorias:allCategorias, subcategorias:allSubcategorias)
		
		[home: true, boxSaldo: boxSaldo, ultimosRegistros: ultimosRegistros, registroRapido: registroRapido]
	}
	
	def save_registro = {
		
		def pagamento = new Pagamento(params)
		pagamento.natureza = (pagamento.categoria?.receita)? Constants.CREDITO : Constants.DEBITO;
		
		def user = session.user.attach()
		pagamento.user = user
		
		if(!pagamento.hasErrors()){
			pagamento.save(flush:true)
		}

		redirect(action: "index")
	}
}
