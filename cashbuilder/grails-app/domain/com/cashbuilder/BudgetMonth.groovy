package com.cashbuilder

class BudgetMonth {

	Integer month
	
	static belongsTo = [budget: Budget]	
	static hasMany = [itens: BudgetItem]
	
	static constraints = {
		month(range:0..11)
	}

	static mapping = {
		sort month: "asc"
	}
}
