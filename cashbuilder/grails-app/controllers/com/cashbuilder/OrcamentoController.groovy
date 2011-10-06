package com.cashbuilder

import com.cashbuilder.beans.BoxSaldoBean;
import com.cashbuilder.beans.orcamento.OrcamentoBean;
import com.cashbuilder.utils.Constants;
import com.cashbuilder.utils.DateUtils;

class OrcamentoController {

	def orcamentoService

	def index = {

		if(!params.mesId){
			params.mesId = DateUtils.mesAtual
		}

		int iMes = Integer.valueOf(params.mesId)
		def user = session.user.attach()
		def orcamento = Orcamento.findByAnoAndUser(DateUtils.anoAtual,user)
		def mes = OrcmMes.findByMesAndOrcamento(iMes,orcamento)

		def meses = OrcmMes.findAllByOrcamento(orcamento)

		def listEntradas = orcamentoService.getOrcmData(user, mes, true)
		def listSaidas = orcamentoService.getOrcmData(user, mes, false)
		
		OrcamentoBean orcamentoBean = new OrcamentoBean()
		orcamentoBean.ano =  orcamento.ano
		orcamentoBean.mes = DateUtils.getMes(mes.mes)
		orcamentoBean.listaCredito = listEntradas
		orcamentoBean.listaDebito = listSaidas

		BoxSaldoBean box = new BoxSaldoBean()
		box.saldoPrevisto = orcamentoService.getSaldoPrevisto(mes)
		box.saldoRealizado = orcamentoService.getSaldoRealizado(mes,user)

		//Tipo de visualizacao
		if(!params.viewType){
			params.viewType = Constants.BASICO
		}

		[orcm: true, meses: meses, orcamento: orcamentoBean, boxSaldo: box]
	}
}
