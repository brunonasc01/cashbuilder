package com.cashbuilder

import com.cashbuilder.beans.BalanceBoxBean;
import com.cashbuilder.beans.DateBean
import com.cashbuilder.beans.fluxocaixa.FluxoCaixaBean;
import com.cashbuilder.utils.Constants;
import com.cashbuilder.utils.DateUtils;

class FluxoCaixaController {

	def orcamentoService
	def geralService
	
    def index = {
	
		if(!params.mesId){
			params.mesId = DateUtils.mesAtual
		}
		
		int mesAtual = Integer.valueOf(params.mesId)
		int anoAtual = DateUtils.anoAtual
		
		def user = session.user.attach()
		def orcamento = Orcamento.findByAnoAndUser(anoAtual,user)

		def meses = OrcmMes.findAllByOrcamento(orcamento)
		def mes = OrcmMes.findByMesAndOrcamento(mesAtual,orcamento)
						
		FluxoCaixaBean bean = new FluxoCaixaBean(pagamentos: geralService.getPagamentos(user,mesAtual,anoAtual))
		bean.date = new DateBean(year: anoAtual, month: DateUtils.getMes(mesAtual))
		
		BalanceBoxBean balanceBox = new BalanceBoxBean()
		balanceBox.title = "box.balance.title2"
		balanceBox.income = orcamentoService.getTotalRealizado(mes,user,Constants.CREDITO)
		balanceBox.expense = orcamentoService.getTotalRealizado(mes,user,Constants.DEBITO)
		balanceBox.balanceClass = (balanceBox.balance >= 0) ? Constants.POSITIVE : Constants.NEGATIVE
		
		[flow: true, monthIndex: mesAtual, meses: meses, fluxoCaixa:bean, balanceBox: balanceBox]
	}
}
