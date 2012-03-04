package com.cashbuilder

import java.util.Date;

import com.cashbuilder.utils.Constants;
import com.cashbuilder.utils.DateUtils;

class EventService {

    static transactional = true

	def orcamentoService
	
    def serviceMethod() {

    }
	
	void checkEvents(Usuario user, Date date){

		calculateBudget(user,date)
		processAlerts(user)
	}
	
	void calculateBudget(Usuario user, Date date){
		Date initialDate = (date)? date : user.dateCreated
		Date actualDate = DateUtils.getHoje(false)

		if(actualDate.minus(initialDate) >= 90){

			Orcamento budget = Orcamento.findByAnoAndUser(DateUtils.anoAtual,user)

			if(!budget.calculated){
				def budgetMonths = budget.meses

				budgetMonths.each { month ->
					def monthItems = month.itens
					def c =  Pagamento.createCriteria()
					
					monthItems.each{ item ->
						double total = c.get {
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
   
	void processAlerts(Usuario user){

		def budget = Orcamento.findByAnoAndUser(DateUtils.anoAtual,user)
		def mes = OrcmMes.findByMesAndOrcamento(DateUtils.mesAtual,budget)
		
		if(orcamentoService.getSaldoPrevisto(mes) > 0 && orcamentoService.getSaldoRealizado(mes,user) > 0){			
			createOrUpdateAlert(budget,Constants.ALERT_SALDO_POSITIVO,"alert.saldo.positivo.message")
			
   		}else if(orcamentoService.getSaldoPrevisto(mes) < 0 || orcamentoService.getSaldoRealizado(mes,user) < 0){
		   createOrUpdateAlert(budget,Constants.ALERT_SALDO_NEGATIVO,"alert.saldo.negativo.message")
		}
	}

	Alert createOrUpdateAlert(Orcamento budget, int type, String messageCode){

		def alert = Alert.findByType(type)
		
		 if(!alert){
			 alert = new Alert(orcamento: budget, enable: true, type: type, message: messageCode)
			 alert.save()
		 } else if(!alert.enable){
			 alert.enable = true
		 }
	}
	
}
