package com.cashbuilder.budget

class BudgetItemSubcategoryBean {

	def budgetItem
	double realizedValue
	String barClass
	int barSize
	
	public String getName(){
		budgetItem?.subcategory.name
	}
	
	public double getBudgetedValue(){
		budgetItem?.budgetedValue
	}
}
