package com.cashbuilder

class BudgetItemController {

	static allowedMethods = [update: "POST", edit: "POST", edit_modal: "POST"]
	
	def generalService
	def eventService
	
	def edit(){
		def budgetItem = BudgetItem.get(params.id)

		[budget: true, bean: budgetItem, monthId: params.monthId]
	}
	
	def edit_modal(){
		def budgetItem = BudgetItem.get(params.id)
		
		if(budgetItem){
			render(view: "edit_modal", model: [bean: budgetItem, monthId: params.monthId])
		}
	}
	
    def update() {
		
		BudgetItem budgetItem = BudgetItem.get(params.id)
		
		if(budgetItem){
			budgetItem.properties = params.properties
			budgetItem.save()
			
			def user = session.user.attach()
			eventService.processAlerts(user)
			generalService.buildMessage(Constants.MSG_SUCCESS,"Orcamento atualizado com sucesso")
		}
		
		redirect(controller:"budget", action: "index", params: [monthId: params.monthId])
	}
}
