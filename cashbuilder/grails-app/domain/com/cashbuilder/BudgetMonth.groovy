package com.cashbuilder

class BudgetMonth {

	Integer month
	double protectionBalance = 0
	
	static belongsTo = [budget: Budget]	
	static hasMany = [itens: BudgetItem]
	
	static constraints = {
		month(range:0..11)
		protectionBalance(blank:false, scale:1)
	}

	static mapping = {
		sort month: "asc"
	}
}
