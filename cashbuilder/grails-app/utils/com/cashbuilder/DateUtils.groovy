package com.cashbuilder

import java.util.Calendar;
import java.util.Date;

class DateUtils {

	/**
	 * Retorna a String equivalente ao mes informado
	 * @param mes numero do mes
	 * @return
	 */
	static String getMes(Integer mes){
		
		switch(mes){
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
			default: return "indefinido"
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
	static Date getHoje(boolean minimo){
		
		Calendar cal = Calendar.getInstance()
		int hora;

		if(minimo){
			hora =cal.getActualMinimum(Calendar.HOUR_OF_DAY)
		}else{
			hora =cal.getActualMaximum(Calendar.HOUR_OF_DAY)
		}

		cal.set(Calendar.HOUR,hora)
		
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
}
