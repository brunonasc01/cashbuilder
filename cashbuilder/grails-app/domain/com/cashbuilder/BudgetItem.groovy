package com.cashbuilder

class BudgetItem {

	Category category
	Subcategory subcategory
	double budgetedValue
	
	static belongsTo = [month: BudgetMonth]
	
    static constraints = {
		category(nullable:false)
		subcategory(nullable:false)
		budgetedValue(blank:false, scale:2)
    }
}
