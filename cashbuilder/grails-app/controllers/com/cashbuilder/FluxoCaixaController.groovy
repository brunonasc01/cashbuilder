package com.cashbuilder

import java.text.DecimalFormat;

import com.cashbuilder.beans.fluxocaixa.FluxoCaixaBean;
import com.cashbuilder.utils.Constants;
import com.cashbuilder.utils.DateUtils;

class FluxoCaixaController {

	def orcamentoService
	
    def index = {
	
		if(!params.mesId){
			params.mesId = DateUtils.mesAtual
		}
		
		int mesAtual = Integer.valueOf(params.mesId)
		int anoAtual = DateUtils.anoAtual
		
		def user = session.user.attach()
		def orcamento = Orcamento.findByAnoAndUser(anoAtual,user)

		//form de filtro		
		def meses = OrcmMes.findAllByOrcamento(orcamento)
		
		//fluxo de caixa
		Date primeiroDia = DateUtils.getPrimeiroDia(mesAtual,anoAtual)
		Date ultimoDia = DateUtils.getUltimoDia(mesAtual,anoAtual)

		def pagamentos = Pagamento.createCriteria().list {
			and {
				eq('user', user)
				between('data', primeiroDia, ultimoDia)
			}
			order("data", "asc")
		}

		FluxoCaixaBean bean = new FluxoCaixaBean(pagamentos:pagamentos)
		
		def mes = OrcmMes.findByMesAndOrcamento(mesAtual,orcamento)
		bean.entradas = orcamentoService.getTotalRealizado(mes,user,Constants.CREDITO)
		bean.saidas = orcamentoService.getTotalRealizado(mes,user,Constants.DEBITO)

		[flow: true, meses: meses, fluxoCaixa:bean]
	}
}
