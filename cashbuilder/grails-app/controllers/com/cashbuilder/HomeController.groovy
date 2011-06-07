package com.cashbuilder

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
		
		[boxSaldo : boxSaldo, ultimosRegistros : ultimosRegistros]
	}
}
