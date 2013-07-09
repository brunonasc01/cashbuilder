package com.cashbuilder

class BudgetItemController {

	static allowedMethods = [update: "POST", edit: "POST"]
	
	def eventService
	
	def edit(){
		def budgetItem = BudgetItem.get(params.id)
		
		if(budgetItem){
			render(view: "edit_item", model: [bean: budgetItem])
		}
	}
	
    def update() {
		
		BudgetItem budgetItem = BudgetItem.get(params.id)
		
		if(budgetItem){
			budgetItem.properties = params.properties
			budgetItem.save()
			
			def user = session.user.attach()
			eventService.processAlerts(user)

			flash.message = "Orcamento atualizado com sucesso"
		}
		
		redirect(controller:"budget", action: "index", params: [monthId: params.monthId])
	}
}
