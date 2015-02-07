package com.cashbuilder.beans

class BalanceBoxBean {

	String title
	String label
	String balanceClass
	double income
	double expense	
	
	public double getBalance(){
		return income - expense
	}
}
