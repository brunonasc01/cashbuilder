package com.cashbuilder

class TransactionController {

	def generalService
	def transactionService
	def eventService
	
	static allowedMethods = [save: "POST", update: "POST", delete: "POST", undelete: "POST"]
	
    def create_modal() {
		def user = session.user.attach()
		def categoriesList = generalService.getCategoriesList(user)

		render(view: "create_modal", model: [categoriesList: categoriesList, monthId: params.monthId])
	}
	
	def create() {
		def user = session.user.attach()
		def categoriesList = generalService.getCategoriesList(user)

		[cashflow: true, categoriesList: categoriesList, monthId: params.monthId]
	}
	
	def edit_modal() {
		def transaction = Transaction.get(params.id)
		
		if (!transaction) {
			generalService.buildMessage(Constants.MSG_ERROR,"form.transaction.edit.error")
			redirect(controller:"cashflow", action: "index")
		} else {
			def categoriesList = generalService.getCategoriesList(transaction.user)
			def category = Category.findById(transaction.category.id)
			def subcategoriesList = category.subcategories
			def df = generalService.getNumberFormatter()
			
			render(view: "edit_modal", model: [categoriesList: categoriesList, subcategoriesList: subcategoriesList,
				 transaction: transaction, df: df])
		}
	}
	
	def save() {
		def user = session.user.attach()
		def transaction = transactionService.saveTransaction(user, params)

		if(transaction.hasErrors()){
			flash.errors = g.renderErrors(bean: transaction)
			generalService.buildMessage(Constants.MSG_ERROR,"form.transaction.message.error")
		} else {
			eventService.processAlerts(user)
			generalService.buildMessage(Constants.MSG_SUCCESS,"form.transaction.message.success")
		}

		boolean full_scr = params.full_scr
		
		if(full_scr && transaction.hasErrors()){
			def categoriesList = generalService.getCategoriesList(user)
			def df = generalService.getNumberFormatter()
			
			render(view: "create", model: [cashflow: true, categoriesList: categoriesList])
		} else {
			redirect(controller:"cashflow", action: "index", params: [monthId: params.monthId])
		}
	}
	
	def edit() {
		def transaction = Transaction.get(params.id)
		
		if (!transaction) {
			generalService.buildMessage(Constants.MSG_ERROR,"form.transaction.edit.error")
			redirect(controller:"cashflow", action: "index")
		} else {
			def categoriesList = generalService.getCategoriesList(transaction.user)
			def category = Category.findById(transaction.category.id)
			def subcategoriesList = category.subcategories
			def df = generalService.getNumberFormatter()

			[cashflow: true, categoriesList: categoriesList, subcategoriesList: subcategoriesList, transaction: transaction, df: df]
		}
	}
	
	def update() {
		def transaction = transactionService.updateTransaction(params)
		
		if(transaction.hasErrors()){
			flash.errors = g.renderErrors(bean: transaction)
			generalService.buildMessage(Constants.MSG_ERROR,"form.transaction.update.error")
		} else {
			def user = session.user.attach()
			eventService.processAlerts(user)
			generalService.buildMessage(Constants.MSG_SUCCESS,"form.transaction.update.success")
		}
		
		boolean full_scr = params.full_scr
		
		if(full_scr && transaction.hasErrors()){
			def categoriesList = generalService.getCategoriesList(transaction.user)
			def category = Category.findById(transaction.category.id)
			def subcategoriesList = category.subcategories
			def df = generalService.getNumberFormatter()

			render(view: "edit", model: [categoriesList: categoriesList, subcategoriesList: subcategoriesList, transaction: transaction, df: df])
		} else {
			redirect(controller:"cashflow", action: "index")
		}
	}
	
	def delete() {
		def user = session.user.attach()
		def transaction = Transaction.get(params.id)
		
		if(transaction){
			transactionService.deleteTransaction(params.id)
			eventService.processAlerts(user)
		}
		def df = generalService.getNumberFormatter()
		
		chain(controller:"cashflow", action: "index", model: [deletedBean: new Transaction(transaction.properties), df: df])
	}
	
	def undelete() {
		def user = session.user.attach()
		def transaction = transactionService.saveTransaction(user, params)
		
		redirect(controller:"cashflow", action: "index")
	}
}
