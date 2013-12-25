package com.cashbuilder

class BudgetItemController {

	static allowedMethods = [update: "POST", edit: "POST", edit_modal: "POST"]
	
	def generalService
	def eventService
	
	def edit(){
		def budgetItem = BudgetItem.get(params.id)
		def df = generalService.getNumberFormatter()

		[budget: true, bean: budgetItem, df: df, monthId: params.monthId]
	}
	
	def edit_modal(){
		def budgetItem = BudgetItem.get(params.id)
		def df = generalService.getNumberFormatter()
		
		if(budgetItem){
			render(view: "edit_modal", model: [bean: budgetItem, df: df, monthId: params.monthId])
		}
	}
	
    def update() {
		
		BudgetItem budgetItem = BudgetItem.get(params.id)
		
		if(budgetItem){
			budgetItem.properties = params
			budgetItem.save()
			
			def user = session.user.attach()
			eventService.processAlerts(user)
			generalService.buildMessage(Constants.MSG_SUCCESS,"Orcamento atualizado com sucesso")
		}
		
		redirect(controller:"budget", action: "index", params: [monthId: params.monthId])
	}
}
