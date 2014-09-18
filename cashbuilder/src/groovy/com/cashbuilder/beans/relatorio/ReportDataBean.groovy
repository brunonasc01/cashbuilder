package com.cashbuilder.beans.relatorio

class ReportDataBean {
	String percent
	String label
	int index
	double total
	
	public int getExpendScale(){
		Math.ceil(Double.valueOf(percent)/25)
	}
}
