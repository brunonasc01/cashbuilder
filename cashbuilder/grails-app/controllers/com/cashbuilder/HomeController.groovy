package com.cashbuilder

import com.cashbuilder.beans.ListaCategoriasBean;
import com.cashbuilder.beans.BoxSaldoBean;
import com.cashbuilder.utils.Constants;
import com.cashbuilder.utils.DateUtils;

class HomeController {

	def orcamentoService
	def geralService
	
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

		def categoriesList = geralService.getCategoriesList(user)
		
		[home: true, boxSaldo: boxSaldo, ultimosRegistros: ultimosRegistros, registroRapido: categoriesList]
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
