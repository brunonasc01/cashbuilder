package com.cashbuilder.utils

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Calendar;
import java.util.Date;

class DateUtils {

	static String moneyMask = "###,###,##0.00"
	
	static String getMonth(Integer month){
		
		switch(month){
			case 1:	return "Janeiro"
			case 2:	return "Fevereiro"
			case 3:	return "Março"
			case 4:	return "Abril"
			case 5:	return "Maio"
			case 6:	return "Junho"
			case 7:	return "Julho"
			case 8:	return "Agosto"
			case 9:	return "Setembro"
			case 10: return "Outubro"
			case 11: return "Novembro"
			case 12: return "Dezembro"
		}
	}
	
	static Date getLastDate(int month, int year){
		Calendar cal = Calendar.getInstance()
		cal.clear()
		cal.set(Calendar.MONTH,month-1)
		cal.set(Calendar.YEAR,year)
		
		int lastDay = cal.getActualMaximum(Calendar.DATE)
		cal.set(Calendar.DATE,lastDay)
		
		return new Date(cal.getTimeInMillis())
	}
	
	static Date getFirstDate(int month, int year){
		Calendar cal = Calendar.getInstance()
		cal.clear()
		cal.set(Calendar.MONTH,month-1)
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
