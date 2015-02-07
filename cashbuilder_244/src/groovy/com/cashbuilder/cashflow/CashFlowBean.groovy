package com.cashbuilder.cashflow

import com.cashbuilder.beans.DateBean;

class CashFlowBean {
	
	DateBean date
	def transactions
	double income
	double expense
	double balance
	
	public double getBalance(){
		return income - expense
	}
}
