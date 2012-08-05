package com.cashbuilder

class BudgetItemController {

	static allowedMethods = [update: "POST"]
	
    def update() {
		
		BudgetItem budgetItem = BudgetItem.get(params.id)
		
		if(budgetItem){
			budgetItem.properties = params.properties
			budgetItem.save()
			flash.message = "Orcamento atualizado com sucesso"
		}
		
		redirect(controller:"budget", action: "index", params: [monthId: params.monthId])
	}
}
