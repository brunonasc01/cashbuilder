package com.cashbuilder

class TransactionController {

	def generalService
	def transactionService
	def eventService
	
	static allowedMethods = [save: "POST", update: "POST"]
	
    def newTransaction() {
		def user = session.user.attach()
		def categoriesList = generalService.getCategoriesList(user)

		render(view: "newtransaction", model: [categoriesList: categoriesList, monthId: params.monthId])
	}
	
	def edit() {
		def transaction = Transaction.get(params.id)
		
		if (!transaction) {
			generalService.buildMessage(Constants.MSG_ERROR,"transaction.edit.error")
			redirect(controller:"cashflow", action: "index")
		} else {
			def categoriesList = generalService.getCategoriesList(transaction.user)
			def category = Category.findById(transaction.category.id)
			def subcategoriesList = category.subcategories
			def df = generalService.getNumberFormatter()
			
			render(view: "edittransaction", model: [categoriesList: categoriesList, subcategoriesList: subcategoriesList,
				 transaction: transaction, df: df])
		}
	}
	
	def save() {
		
		def user = session.user.attach()
		def transaction = transactionService.saveTransaction(user, params)

		if(transaction.hasErrors()){
			flash.errors = g.renderErrors(bean: transaction)
			generalService.buildMessage(Constants.MSG_ERROR,"transaction.data.invalid")
		} else {
			eventService.processAlerts(user)
			generalService.buildMessage(Constants.MSG_SUCCESS,"transaction.data.success")
		}

		redirect(controller:"cashflow", action: "index", params: [monthId: params.monthId])
	}
	
	def delete() {
		transactionService.deleteTransaction(params.id)
		generalService.buildMessage(Constants.MSG_SUCCESS,"transaction.delete.success")
		
		redirect(controller:"cashflow", action: "index")
	}
	
	def update() {
		def transaction = transactionService.updateTransaction(params)
		
		if(transaction.hasErrors()){
			flash.errors = g.renderErrors(bean: transaction)
			generalService.buildMessage(Constants.MSG_ERROR,"transaction.update.data.invalid")
		} else {
			def user = session.user.attach()
			eventService.processAlerts(user)
			generalService.buildMessage(Constants.MSG_SUCCESS,"transaction.update.data.success")
		}
			
		redirect(controller:"cashflow", action: "index")
	}
}
