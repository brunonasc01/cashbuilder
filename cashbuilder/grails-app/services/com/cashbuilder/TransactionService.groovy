package com.cashbuilder

import java.util.Map;

import org.codehaus.groovy.grails.web.util.WebUtils;
import org.joda.time.DateTime;

class TransactionService {

	static transactional = true
	
	def messageSource
	def budgetService
	
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

				handleBudgetUpdate(user,transaction)
				
				return transaction
			} else {
				return saveTransactionParcels(user,params)
			}
		}
	}
	
	void handleBudgetUpdate(User user, Transaction transaction){
		if(!transaction.hasErrors()){
			DateTime date = new DateTime(transaction.date);
			def budget = Budget.findByYearAndUser(date.year,user)

			if(budget) {
				def budgetMonth = BudgetMonth.findByMonthAndBudget(date.monthOfYear-1,budget)
				double budgetTotal = budgetService.getBudgetedTotal(budgetMonth,transaction.subcategory)
				double realizedTotal = budgetService.getRealizedTotal(budgetMonth, user, transaction.subcategory)
				double balance = realizedTotal - budgetTotal

				if(budgetTotal <= 0 || balance > 0.5){
					BudgetItem budgetItem = BudgetItem.findBySubcategoryAndMonth(transaction.subcategory,budgetMonth)

					if(budgetItem){
						budgetItem.budgetedValue += (budgetItem.budgetedValue > 0 )? (balance) : realizedTotal;
						def flashScope = WebUtils.retrieveGrailsWebRequest().flashScope
						flashScope.budget_updated = true 
					}
				}
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
	
				Object[] parcelParam = [it+1,parcels]			
				transactionParcel.description += " "+messageSource.getMessage("transaction.parcel.suffix",parcelParam,"parcela",new Locale("pt", "BR")) 
				
				transactionParcel.date = new Date(transactionDate.getTimeInMillis())
				transactionParcel.save(flush:true)
				
				handleBudgetUpdate(user,transactionParcel)
				
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
	
	Transaction updateTransaction(Map params){		
		def transaction = Transaction.get(params.id)
		
		if(transaction) {
			transaction.properties = params
			transaction.nature = (transaction.category.income)? Constants.CREDITO : Constants.DEBITO;
			
			if(transaction.validate()){
				transaction.save()
			}
		}
		
		transaction
	}
	
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
