package com.cashbuilder

import com.cashbuilder.beans.ListaCategoriasBean;
import com.cashbuilder.beans.BalanceBoxBean;
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
		BalanceBoxBean balanceBox = new BalanceBoxBean();
		balanceBox.title = "box.balance.title1"
		balanceBox.income = orcamentoService.getTotalRealizado(mesAtual,user,Constants.CREDITO)
		balanceBox.expense = orcamentoService.getTotalRealizado(mesAtual,user,Constants.DEBITO)		
		balanceBox.balanceClass = (balanceBox.balance >= 0) ? Constants.POSITIVE : Constants.NEGATIVE
		
		//box ultimos registro
		def ultimosRegistros = Pagamento.createCriteria().list(max:3) {
			eq('user', user)
			order("id", "desc")
		}

		def categoriesList = geralService.getCategoriesList(user)
		def alerts = Alert.findAllByOrcamento(orcamento)
		
		[home: true, balanceBox: balanceBox, ultimosRegistros: ultimosRegistros, registroRapido: categoriesList, alerts: alerts]
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
