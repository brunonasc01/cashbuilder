package com.cashbuilder

import java.util.Calendar;
import java.util.Date;

class DateUtils {

	/**
	 * Retorna a String equivalente ao mes informado
	 * @param mes numero do mes
	 * @return
	 */
	static String getMonth(Integer month){
		
		switch(month){
			case 0:	return "month.january"
			case 1:	return "month.february"
			case 2:	return "month.march"
			case 3:	return "month.april"
			case 4:	return "month.may"
			case 5:	return "month.june"
			case 6:	return "month.july"
			case 7:	return "month.august"
			case 8:	return "month.setptember"
			case 9: return "month.october"
			case 10: return "month.november"
			case 11: return "month.december"
			default: return "month.undefined"
		}
	}
		
	/**
	 * 
	 * @param month
	 * @param year
	 * @return
	 */
	static Date getLastDay(int month, int year){
		Calendar cal = Calendar.getInstance()
		cal.clear()
		cal.set(Calendar.MONTH,month)
		cal.set(Calendar.YEAR,year)
		
		int lastDay = cal.getActualMaximum(Calendar.DATE)
		cal.set(Calendar.DATE,lastDay)
		
		int lastHour = cal.getActualMaximum(Calendar.HOUR_OF_DAY)
		cal.set(Calendar.HOUR_OF_DAY,lastHour)
		
		int lastTime = cal.getActualMaximum(Calendar.MINUTE)
		cal.set(Calendar.MINUTE,lastTime) 	
		cal.set(Calendar.SECOND,lastTime)
		
		return new Date(cal.getTimeInMillis())
	}
		
	/**
	 * 
	 * @param month
	 * @param year
	 * @return
	 */
	static Date getFirstDay(int month, int year){
		Calendar cal = Calendar.getInstance()
		cal.clear()
		cal.set(Calendar.MONTH,month)
		cal.set(Calendar.YEAR,year)
		
		int firstDay = cal.getActualMinimum(Calendar.DATE)
		cal.set(Calendar.DATE,firstDay)
		
		return new Date(cal.getTimeInMillis())
	}
	
	/**
	 * Obtem o dia informado
	 * @param dia o dia
	 * @param mes o mes
	 * @param ano o ano
	 * @param amanhecer se verdadeiro, o retorno sera a primeira hora, senao sera a ultima
	 * @return o dia
	 */
	static Date getDia(int dia, int mes, int ano, boolean amanhecer ){
		Calendar cal = Calendar.getInstance()
		cal.clear()
		cal.set(Calendar.DATE,dia)
		cal.set(Calendar.MONTH,mes)
		cal.set(Calendar.YEAR,ano)
		
		int hora;
		
		if(amanhecer){
			hora =cal.getActualMinimum(Calendar.HOUR_OF_DAY)
		}else{
			hora =cal.getActualMaximum(Calendar.HOUR_OF_DAY)
		}
		
		cal.set(Calendar.HOUR,hora)
		
		return new Date(cal.getTimeInMillis())
	}
	
	/**
	 * Obtem o dia atual
	 * @param minimo se verdadeiro, obtem a primeira hora do dia
	 * @return o dia atual
	 */
	static Date getToday(boolean minimum){
		
		Calendar cal = Calendar.getInstance()
		int hour;

		if(minimum){
			hour =cal.getActualMinimum(Calendar.HOUR_OF_DAY)
		}else{
			hour =cal.getActualMaximum(Calendar.HOUR_OF_DAY)
		}

		cal.set(Calendar.HOUR,hour)
		
		new Date(cal.getTimeInMillis())
	}
	
	/**
	 * Obtem o ano atual
	 * @return o ano atual
	 */
	static int getCurrentYear(){
		return Calendar.getInstance().get(Calendar.YEAR)
	}
	
	/**
	 * Obtem o mes atual
	 * @return o mes atual
	 */
	static int getCurrentMonth(){
		return Calendar.getInstance().get(Calendar.MONTH)
	}
	
	static boolean isLastMonthOfYear(){
		return DateUtils.currentMonth.equals(Calendar.DECEMBER)
	}
}
