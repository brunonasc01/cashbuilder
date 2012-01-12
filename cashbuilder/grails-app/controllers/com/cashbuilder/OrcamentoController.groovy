package com.cashbuilder

import com.cashbuilder.beans.BalanceBoxBean;
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

		BalanceBoxBean balanceBox = new BalanceBoxBean(isBudget:true)
		balanceBox.title = "box.balance.title3"
		balanceBox.plannedBalance = orcamentoService.getSaldoPrevisto(mes)
		balanceBox.actualBalance = orcamentoService.getSaldoRealizado(mes,user)
		balanceBox.plannedClass = (balanceBox.plannedBalance >= 0) ? Constants.POSITIVE : Constants.NEGATIVE
		balanceBox.actualClass = (balanceBox.actualBalance >= 0) ? Constants.POSITIVE : Constants.NEGATIVE
		
		[orcm: true, monthIndex: iMes, meses: meses, orcamento: orcamentoBean, balanceBox: balanceBox]
	}
}
