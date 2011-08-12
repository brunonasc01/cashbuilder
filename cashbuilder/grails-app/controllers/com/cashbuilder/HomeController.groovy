package com.cashbuilder

import com.cashbuilder.beans.BoxRegRapidoBean;
import com.cashbuilder.beans.BoxSaldoBean;
import com.cashbuilder.utils.Constants;
import com.cashbuilder.utils.DateUtils;

class HomeController {

	def orcamentoService
	
    def index = {
		
		def user = session.user.attach()
		def orcamento = Orcamento.findByAnoAndUser(Calendar.getInstance().get(Calendar.YEAR),user)
		def mes = OrcmMes.findByMesAndOrcamento(Calendar.getInstance().get(Calendar.MONTH),orcamento)
		
		
		//box saldo
		BoxSaldoBean boxSaldo = new BoxSaldoBean();
		boxSaldo.entradas = orcamentoService.getTotalRealizado(mes,user,Constants.CREDITO)
		boxSaldo.saidas = orcamentoService.getTotalRealizado(mes,user,Constants.DEBITO)		
		boxSaldo.saldo = boxSaldo.entradas - boxSaldo.saidas

		int iMes = DateUtils.mesAtual
		int iAno = DateUtils.anoAtual
		
		Date firstDate = DateUtils.getPrimeiroDia(iMes,iAno)
		Date lastDate = DateUtils.getUltimoDia(iMes,iAno)
		
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
		
		
		//box ultimos pagamentos
		def ultimosRegistros = Pagamento.createCriteria().list(max:3) {
			eq('user', user)
			order("id", "desc")
		}
		
		//box registro rapido
		def allCategorias = Categoria.findAllByUser(user)
		List allSubcategoria = new ArrayList()

		allCategorias.each { categoria ->
			def subcategorias = Subcategoria.findAllByCategoria(categoria)
			allSubcategoria.addAll(subcategorias)
		}

		BoxRegRapidoBean registroRapido = new BoxRegRapidoBean(categorias:allCategorias, subcategorias:allSubcategoria)
		
		[home: true, boxSaldo : boxSaldo, ultimosRegistros : ultimosRegistros, registroRapido : registroRapido]
	}
	
	def save_registro = {
		
		def pagamento = new Pagamento(params)

		if(pagamento?.categoria?.receita){
			pagamento.natureza = Constants.CREDITO
		} else {
			pagamento.natureza = Constants.DEBITO
		}
		
		def user = session.user.attach()
		pagamento.user = user
		
		if(!pagamento.hasErrors()){
			pagamento.save(flush:true)
		}

		redirect(action: "index")
	}
}
