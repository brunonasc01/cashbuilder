package com.cashbuilder

class BudgetItemController {

	def scaffold = true
	
    def update() {
		
		BudgetItem budgetItem = BudgetItem.get(params.id)
		
		if(budgetItem){
			budgetItem.properties = params.properties
			println budgetItem.save()
			flash.message = "Orcamento atualizado com sucesso"
		}
		
		redirect(controller:"budget", action: "index", params: [monthId: params.monthId])
	}
}
