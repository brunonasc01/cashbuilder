package com.cashbuilder.budget

class BudgetItemSubcategoryBean {

	def budgetItem
	double realizedValue

	public String getName(){
		budgetItem?.subcategory.name
	}
	
	public double getBudgetedValue(){
		budgetItem?.budgetedValue
	}
}
