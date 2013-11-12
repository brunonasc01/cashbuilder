package com.cashbuilder

import java.util.Date;

class EventService {

    static transactional = true

	def budgetService
	
    def serviceMethod() {

    }
	
	void checkEvents(User user, Date date){

		calculateBudget(user,date)
		processAlerts(user)
	}
	
	void calculateBudget(User user, Date date){
		Date initialDate = (date)? date : user.dateCreated
		Date actualDate = DateUtils.getToday(false)

		if(actualDate.minus(initialDate) >= 90){
			Budget budget = Budget.findByYearAndUser(DateUtils.currentYear,user)

			if(!budget.calculated){
				def budgetMonths = budget.months

				budgetMonths.each { month ->
					def monthItems = month.itens
					def c = Transaction.createCriteria()
					
					monthItems.each{ item ->
						double total = c.get {
							and {
								eq('user', user)
								eq('subcategory', item.subcategory)
								between('date', initialDate-1, actualDate)
							}
							projections { sum "value" }
						}

						double media = (total)? total/3 : 0

						if(media > 0){
							item.budgetedValue = media
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
	M: Informar o usuario sobre a falta de caixa e recomendar o resgate de aplicacoes
	ou o remanejamento do orcamento
	
	2- Alerta (Ausencia de investimento no mes)
	R: Para o mes atual, quando nao existir valor reservado para investimento
	M: alertar sobre a necessidade de reservar parte da receita para investimentos.

	*/
   
	void processAlerts(User user){

		def budget = Budget.findByYearAndUser(DateUtils.currentYear,user)
		def month = BudgetMonth.findByMonthAndBudget(DateUtils.currentMonth,budget)

		resetAlerts(budget)
				
		if(budgetService.getBudgetedBalance(month) < 0){
		   createOrUpdateAlert(budget,Constants.ALERT_ORCAMENTO_NEGATIVO,"alert.budget.negative.message")
		   
		} else if(budgetService.getBalance(month,user) < 0){
		   createOrUpdateAlert(budget,Constants.ALERT_SALDO_NEGATIVO,"alert.balance.negative.message")

		} else if(budgetService.getBudgetedBalance(month) > 0 && budgetService.getBalance(month,user) > 0){			
			createOrUpdateAlert(budget,Constants.ALERT_SALDO_POSITIVO,"alert.balance.positive.message")
			
   		}
	}

	void resetAlerts(Budget budget){
		
		def alerts = Alert.findAllByBudget(budget)
		
		alerts.each{
			it.enable = false
		}
	}
	
	Alert createOrUpdateAlert(Budget budget, int type, String messageCode){

		Alert alert = Alert.findByType(type)
		
		 if(!alert){
			 alert = new Alert(budget: budget, enable: true, type: type, message: messageCode)
			 alert.save()
		 } else if(!alert.enable){
			 alert.enable = true
		 }
		 
		 return alert
	}
}
