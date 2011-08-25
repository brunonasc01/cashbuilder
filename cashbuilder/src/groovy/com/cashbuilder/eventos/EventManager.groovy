package com.cashbuilder.eventos

import java.util.Date;

import com.cashbuilder.Orcamento;
import com.cashbuilder.OrcmItem;
import com.cashbuilder.OrcmMes;
import com.cashbuilder.Pagamento;
import com.cashbuilder.Usuario;
import com.cashbuilder.utils.DateUtils;

class EventManager {

	void checkEvents(Usuario user, Date date){
		
		calculateBudget(user,date)
	}
	
	private void calculateBudget(Usuario user, Date date){
		Date initialDate = (date)? date : user.dateCreated
		Date actualDate = DateUtils.getHoje(false)

		if(actualDate.minus(initialDate) >= 90){

			Orcamento budget = Orcamento.findByAnoAndUser(DateUtils.anoAtual,user)

			if(!budget.calculated){

				def budgetMonths = budget.meses

				budgetMonths.each { month ->
					def monthItems = month.itens

					monthItems.each{ item ->
						double total = Pagamento.createCriteria().get {
							and {
								eq('user', user)
								eq('subcategoria', item.subcategoria)
								between('data', initialDate-1, actualDate)
							}
							projections { sum "valor" }
						}

						double media = (total)? total/3 : 0

						if(media > 0){
							item.valorPrevisto = media
						}
					}
				}

				budget.calculated = true
			}
		}
	}
	
	/*
	Essa classe ira processar a exibicao ou nao de alertas
	
	1- Alerta (Ausencia de caixa para pagamentos)
	R: Para o dia atual, quando o saldo em caixa for insuficiente para os pagamentos
	M: Informar o usuário sobre a falta de caixa e recomendar o resgate de aplicacoes
	ou o remanejamento do orcamento
	
	2- Alerta (Ausencia de investimento no mes)
	R: Para o mes atual, quando não existir valor reservado para investimento
	M: alertar sobre a necessidade de reservar parte da receita para investimentos.

	*/
   
   private void processaAlertas(Usuario usuario){
	   
	   //Debitos > Creditos
	   Date hojeCedo = DateUtils.getHoje(true)
	   Date hojeNoite = DateUtils.getHoje(false)
	   
//	   double entradas = geralService.getTotalPagamentos(usuario,hojeCedo, hojeNoite, Constants.CREDITO)
//	   double saidas = geralService.getTotalPagamentos(usuario,hojeCedo, hojeNoite, Constants.DEBITO)
	   
   }
}
