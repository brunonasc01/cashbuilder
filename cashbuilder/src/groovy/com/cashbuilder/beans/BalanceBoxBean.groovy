package com.cashbuilder.beans

class BalanceBoxBean {

	String title
	String plannedClass
	String actualClass
	String balanceClass

	double income
	double plannedIncome
	double expense
	double plannedExpense
	double plannedBalance
	double actualBalance
	boolean isBudget
	
	public double getBalance(){
		return income - expense
	}
}
