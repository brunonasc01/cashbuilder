package com.cashbuilder

import java.util.Map;

class TransactionService {

	static transactional = true
	
    def serviceMethod() {

    }
	
	Transaction saveTransaction(User user, Map params){
		if(user){
			int parcels = Integer.valueOf(params.parcels)?: 1

			if(parcels <= 1){
				def transaction = new Transaction(params.properties)
				transaction.nature = (transaction.category?.income)? Constants.CREDITO : Constants.DEBITO
				transaction.user = user

				transaction.save()

				return transaction
			} else {
				return saveTransactionParcels(user,params)
			}
		}
	}
	
	Transaction saveTransactionParcels(User user, Map params){
		
		Calendar transactionDate = Calendar.getInstance()
		def baseTransaction = new Transaction(params.properties)
		baseTransaction.nature = (baseTransaction.category?.income)? Constants.CREDITO : Constants.DEBITO
		baseTransaction.user = user

		if(baseTransaction.validate()){
			transactionDate.setTime(baseTransaction.date)
			int parcels = baseTransaction.parcels
			baseTransaction.value = baseTransaction.value/parcels
			baseTransaction.parcels = 1
	
			int transactionMonth = transactionDate.get(Calendar.MONTH)
			int transactionYear = transactionDate.get(Calendar.YEAR)
	
			(0..parcels-1).each {
				transactionDate.set(Calendar.MONTH,transactionMonth)
				transactionDate.set(Calendar.YEAR,transactionYear)
				
				def transactionParcel = new Transaction(baseTransaction.properties)
				transactionParcel.date = new Date(transactionDate.getTimeInMillis())
				transactionParcel.save(flush:true)
				
				if(transactionMonth == Calendar.DECEMBER){
					transactionMonth = 0
					transactionYear += 1
				} else {
					transactionMonth += 1
				}
			}
		}
		
		return baseTransaction;
	}
	
	boolean deleteTransaction(String transactionId){
		def transaction = Transaction.get(transactionId)

		if(transaction) {
			transaction.delete()
			return true;
		}
	}
	
//	Pagamento updatePayment(String paymentId, String properties){
//		def pagamento = Pagamento.get(paymentId)
//		
//		if(pagamento) {
//			pagamento.properties = properties
//			pagamento.natureza = (pagamento.categoria.receita)? Constants.CREDITO : Constants.DEBITO;
//			
//			if(pagamento.validate()){
//				return pagamento
//			} else {
//				throw new ValidationException("Pagamento invalido",pagamento.errors)
//			}
//		}
//		throw new RuntimeException(message: "Nao foi possivel atualizar o registro, tente novamente")
//	}
	
	def getTransactions(User user, int month, int year){
		
		Date firstDay = DateUtils.getFirstDay(month,year)
		Date lastDay = DateUtils.getLastDay(month,year)

		def c = Transaction.createCriteria()
		def transactions = c.list {
			and {
				eq('user', user)
				between('date', firstDay, lastDay)
			}
			order("date", "asc")
		}
		
		transactions
	}
}
