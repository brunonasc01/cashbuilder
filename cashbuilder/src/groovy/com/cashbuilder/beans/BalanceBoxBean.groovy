package com.cashbuilder.beans

import com.cashbuilder.OrcmMes;
import com.cashbuilder.Usuario;

class BalanceBoxBean {

	String title
	String plannedClass
	String actualClass
	String balanceClass

	double income
	double expense
	double plannedBalance
	double actualBalance
	boolean isBudget
	
	public double getBalance(){
		return income - expense
	}
}
