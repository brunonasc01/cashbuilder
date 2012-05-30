package com.cashbuilder

class TransactionController {

	def generalService
	def transactionService
	
    def newTransaction() {
		def user = session.user.attach()
		def categoriesList = generalService.getCategoriesList(user)

		render(view: "newtransaction", model: [categoriesList: categoriesList, monthId: params.monthId])
	}
	
	def edit() {
		def transaction = Transaction.get(params.id)
		
		if (!transaction) {
			flash.message = "Nao foi possivel editar o pagamento, tente novamente"
			redirect(controller:"cashflow", action: "index")
		} else {
			def categoriesList = generalService.getCategoriesList(transaction.user)
			def df = generalService.getNumberFormatter()
			render(view: "edittransaction", model: [categoriesList: categoriesList, transaction: transaction, df: df])
		}
	}
	
	def save() {
		
		def user = session.user.attach()
		def transaction = transactionService.saveTransaction(user, params)

		if(transaction.hasErrors()){
			flash.message = g.renderErrors(bean: transaction)
		}

		redirect(controller:"cashflow", action: "index", params: [monthId: params.monthId])
	}
	
	def update() {
		def transaction = transactionService.updateTransaction(params)
		
		if(transaction.hasErrors()){
			flash.message = g.renderErrors(bean: transaction)
		}
			
		redirect(controller:"cashflow", action: "index")
	}
}
