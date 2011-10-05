package com.cashbuilder

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
						
		FluxoCaixaBean bean = new FluxoCaixaBean(pagamentos: geralService.getPagamentos(user,mesAtual,anoAtual),
			entradas: orcamentoService.getTotalRealizado(mes,user,Constants.CREDITO),
			saidas: orcamentoService.getTotalRealizado(mes,user,Constants.DEBITO))

		[flow: true, meses: meses, fluxoCaixa:bean]
	}
}
