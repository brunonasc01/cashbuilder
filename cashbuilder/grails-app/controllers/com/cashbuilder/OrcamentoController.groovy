package com.cashbuilder

import com.cashbuilder.beans.BalanceBoxBean;
import com.cashbuilder.beans.DateBean;
import com.cashbuilder.beans.orcamento.OrcamentoBean;
import com.cashbuilder.utils.Constants;
import com.cashbuilder.utils.DateUtils;

class OrcamentoController {

	def orcamentoService
	def geralService
	
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
		orcamentoBean.date = new DateBean(year: orcamento.ano, month: DateUtils.getMes(mes.mes))
		orcamentoBean.listaCredito = listEntradas
		orcamentoBean.listaDebito = listSaidas

		BalanceBoxBean balanceBox = new BalanceBoxBean(isBudget:true)
		balanceBox.title = "box.balance.title3"
		balanceBox.plannedBalance = orcamentoService.getSaldoPrevisto(mes)
		balanceBox.actualBalance = orcamentoService.getSaldoRealizado(mes,user)
		balanceBox.plannedClass = (balanceBox.plannedBalance >= 0) ? Constants.POSITIVE : Constants.NEGATIVE
		balanceBox.actualClass = (balanceBox.actualBalance >= 0) ? Constants.POSITIVE : Constants.NEGATIVE
		
		def df = geralService.getFormatadorNumerico()
		
		[orcm: true, monthIndex: iMes, meses: meses, orcamento: orcamentoBean, balanceBox: balanceBox, df: df]
	}
}
