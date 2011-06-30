package com.cashbuilder

import java.text.DecimalFormat;

import com.cashbuilder.beans.fluxocaixa.FluxoCaixaBean;
import com.cashbuilder.utils.DateUtils;

class FluxoCaixaController {

	def fluxocaixaService
	
    def index = {
	
		if(!params.mesId || !params.anoId){
			params.mesId = Calendar.getInstance().get(Calendar.MONTH)
			params.anoId = DateUtils.currentYear
		}
		
		int iMes = Integer.valueOf(params.mesId)
		int iAno = Integer.valueOf(params.anoId)
		
		def user = session.user.attach()
		def orcamento = Orcamento.findByAnoAndUser(iAno,user)

		//form de filtro
		def orcamentos = Orcamento.findAllByUser(user)
		def meses = OrcmMes.findAllByOrcamento(orcamento)
		
		//fluxo de caixa
		Date firstDate = DateUtils.getFirstDate(iMes,iAno)
		Date lastDate = DateUtils.getLastDate(iMes,iAno)
		
		def pagamentos = Pagamento.createCriteria().list {
			and {
				eq('user', user)
				between('data', firstDate, lastDate)
			}
		}

		FluxoCaixaBean bean = new FluxoCaixaBean(pagamentos:pagamentos)
		
		def mes = OrcmMes.findByMesAndOrcamento(iMes,orcamento)

		bean.entradas = fluxocaixaService.calcTotal(mes,user,true)
		bean.saidas = fluxocaixaService.calcTotal(mes,user,false)
		bean.saldo = fluxocaixaService.calcSaldo(mes,user)
				
		
		[flow: true, anos: orcamentos, meses: meses,fluxoCaixa:bean]
	}
}
