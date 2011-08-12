package com.cashbuilder.utils

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
	 * Obtem o ultimo dia do mes
	 * @param mes o mes
	 * @param ano o ano
	 * @return o ultimo dia do mes
	 */
	static Date getUltimoDia(int mes, int ano){
		Calendar cal = Calendar.getInstance()
		cal.clear()
		cal.set(Calendar.MONTH,mes)
		cal.set(Calendar.YEAR,ano)
		
		int ultimoDia = cal.getActualMaximum(Calendar.DATE)
		cal.set(Calendar.DATE,ultimoDia)
		
		return new Date(cal.getTimeInMillis())
	}
	
	/**
	 * Obtem o primeiro dia do mes
	 * @param mes o mes
	 * @param ano o ano
	 * @return o primeiro dia do mes
	 */
	static Date getPrimeiroDia(int mes, int ano){
		Calendar cal = Calendar.getInstance()
		cal.clear()
		cal.set(Calendar.MONTH,mes)
		cal.set(Calendar.YEAR,ano)
		
		int primeiroDia = cal.getActualMinimum(Calendar.DATE)
		cal.set(Calendar.DATE,primeiroDia)
		
		return new Date(cal.getTimeInMillis())
	}
	
	/**
	 * Obtem o ano atual
	 * @return o ano atual
	 */
	static int getAnoAtual(){
		
		return Calendar.getInstance().get(Calendar.YEAR)
	}
	
	/**
	 * Obtem o mes atual
	 * @return o mes atual
	 */
	static int getMesAtual(){
		
		return Calendar.getInstance().get(Calendar.MONTH)
	}
}
