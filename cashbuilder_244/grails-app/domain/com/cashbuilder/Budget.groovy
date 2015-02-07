package com.cashbuilder

class Budget {

	Integer year
	boolean calculated
	
	static belongsTo = [user: User]
	static hasMany = [months: BudgetMonth, alerts: Alert]
	
    static constraints = {
		year(blank:false)
    }
	
	static mapping = {
		months sort: 'month'
	}
}
