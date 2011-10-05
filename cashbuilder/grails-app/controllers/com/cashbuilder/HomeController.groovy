package com.cashbuilder

import com.cashbuilder.beans.ListaCategoriasBean;
import com.cashbuilder.beans.BoxSaldoBean;
import com.cashbuilder.utils.Constants;
import com.cashbuilder.utils.DateUtils;

class HomeController {

	def orcamentoService
	def geralService
	def paymentService
	
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
		
		try {
			def user = session.user.attach()
			def newPayment = paymentService.savePayment(user, params.properties)
			flash.message = "Pagamento gravado com sucesso"
		} catch (RuntimeException re){
			flash.message = re.message
		}
		redirect(action: "index")
	}
}
