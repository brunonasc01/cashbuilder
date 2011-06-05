package com.cashbuilder.utils

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Calendar;
import java.util.Date;

class DateUtils {

	static String moneyMask = "###,###,##0.00"
	
	static String getMonth(Integer month){
		
		switch(month){
			case 0:	return "Janeiro"
			case 1:	return "Fevereiro"
			case 2:	return "Março"
			case 3:	return "Abril"
			case 4:	return "Maio"
			case 5:	return "Junho"
			case 6:	return "Julho"
			case 7:	return "Agosto"
			case 8:	return "Setembro"
			case 9: return "Outubro"
			case 10: return "Novembro"
			case 11: return "Dezembro"
		}
	}
	
	static Date getLastDate(int month, int year){
		Calendar cal = Calendar.getInstance()
		cal.clear()
		cal.set(Calendar.MONTH,month)
		cal.set(Calendar.YEAR,year)
		
		int lastDay = cal.getActualMaximum(Calendar.DATE)
		cal.set(Calendar.DATE,lastDay)
		
		return new Date(cal.getTimeInMillis())
	}
	
	static Date getFirstDate(int month, int year){
		Calendar cal = Calendar.getInstance()
		cal.clear()
		cal.set(Calendar.MONTH,month)
		cal.set(Calendar.YEAR,year)
		
		int lastDay = cal.getActualMinimum(Calendar.DATE)
		cal.set(Calendar.DATE,lastDay)
		
		return new Date(cal.getTimeInMillis())
	}
	
	static int getCurrentYear(){
		
		return Calendar.getInstance().get(Calendar.YEAR)
	}

	static main(args){

		//println getLastDate(2,2009)
		
		double total = 1150.33
		
		DecimalFormat df = new DecimalFormat("###,###,##0.00");

		//NumberFormat nf = NumberFormat.getCurrencyInstance(new Locale ("pt", "BR"));
		
		
		println df.format(total)
	}
}
