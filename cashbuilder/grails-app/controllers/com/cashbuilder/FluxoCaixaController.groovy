package com.cashbuilder

import java.text.DecimalFormat;

import com.cashbuilder.beans.fluxocaixa.FluxoCaixaBean;
import com.cashbuilder.utils.Constants;
import com.cashbuilder.utils.DateUtils;

class FluxoCaixaController {

	def orcamentoService
	
    def index = {
	
		if(!params.mesId || !params.anoId){
			params.mesId = Calendar.getInstance().get(Calendar.MONTH)
			params.anoId = DateUtils.anoAtual
		}
		
		int iMes = Integer.valueOf(params.mesId)
		int iAno = Integer.valueOf(params.anoId)
		
		def user = session.user.attach()
		def orcamento = Orcamento.findByAnoAndUser(iAno,user)

		//form de filtro
		def orcamentos = Orcamento.findAllByUser(user)
		def meses = OrcmMes.findAllByOrcamento(orcamento)
		
		//fluxo de caixa
		Date firstDate = DateUtils.getPrimeiroDia(iMes,iAno)
		Date lastDate = DateUtils.getUltimoDia(iMes,iAno)

		def pagamentos = Pagamento.createCriteria().list {
			and {
				eq('user', user)
				between('data', firstDate, lastDate)
			}
			order("data", "asc")
		}

		FluxoCaixaBean bean = new FluxoCaixaBean(pagamentos:pagamentos)
		
		def mes = OrcmMes.findByMesAndOrcamento(iMes,orcamento)

		bean.entradas = orcamentoService.getTotalRealizado(mes,user,Constants.CREDITO)
		bean.saidas = orcamentoService.getTotalRealizado(mes,user,Constants.DEBITO)
		bean.saldo = orcamentoService.getSaldoRealizado(mes,user)
				
		
		[flow: true, anos: orcamentos, meses: meses,fluxoCaixa:bean]
	}
}
