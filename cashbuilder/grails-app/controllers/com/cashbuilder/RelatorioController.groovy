package com.cashbuilder

import com.cashbuilder.utils.DateUtils;

class RelatorioController {

	def orcamentoService
	def fluxocaixaService
	
    def index = {
		
		redirect(action:orcamento)	
	}
	
	def orcamento = {
		
		def user = session.user.attach()
		def orcamento = Orcamento.findByAnoAndUser(Calendar.getInstance().get(Calendar.YEAR),user)
		def categoriasDeb = Categoria.findAllByReceitaAndUser(false,user)
		def categoriasCred = Categoria.findAllByReceitaAndUser(true,user)

		[orcamento : orcamento, saidas : categoriasDeb, entradas : categoriasCred, service : orcamentoService]
	}
	
	def fluxocaixa = {

		if(!params.mesId || !params.anoId){
			params.mesId = 1
			params.anoId = DateUtils.currentYear
		}

		def user = session.user.attach()
		
		int mes = Integer.valueOf(params.mesId)
		int ano = Integer.valueOf(params.anoId)
		
		Date firstDate = DateUtils.getFirstDate(mes,ano)
		Date lastDate = DateUtils.getLastDate(mes,ano)
		
		def pagamentos = Pagamento.createCriteria().list {
			and {
				eq('user', user)
				between('data', firstDate, lastDate)
			}
		}
		
		def orcamentos = Orcamento.findAllByUser(user)
		
		def curOrcm = Orcamento.findByUserAndAno(user,ano)
		def meses = OrcmMes.findAllByOrcamento(curOrcm)
		
		def curMes = OrcmMes.findByOrcamentoAndMes(curOrcm,mes)

		[pagamentos: pagamentos, anos: orcamentos, meses: meses, mes: curMes, service: fluxocaixaService]
	}
	
	def grafico = {
		
		if(!params.mesId || !params.anoId){
			params.mesId = 1
			params.anoId = DateUtils.currentYear
		}

		def user = session.user.attach()
		
		int mes = Integer.valueOf(params.mesId)
		int ano = Integer.valueOf(params.anoId)
		
		Date firstDate = DateUtils.getFirstDate(mes,ano)
		Date lastDate = DateUtils.getLastDate(mes,ano)
		
		def pagamentos = Pagamento.createCriteria().list {
			and {
				eq('user', user)
				between('data', firstDate, lastDate)
			}
		}
		
		def pgsNoMes = [:]
		
		for(Pagamento pg :pagamentos){
			
			String subCategoria = pg.subcategoria
			pgsNoMes.put(subCategoria,pg.valor)
		}
		
		def orcamentos = Orcamento.findAllByUser(user)
		
		def curOrcm = Orcamento.findByUserAndAno(user,ano)
		def meses = OrcmMes.findAllByOrcamento(curOrcm)
		
		def curMes = OrcmMes.findByOrcamentoAndMes(curOrcm,mes)

		[pgsNoMes: pgsNoMes, anos: orcamentos, meses: meses, mes: curMes]
	}
	
}
