package com.cashbuilder.utils

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;

class Constants {

	static String DEBITO = "D"
	static String CREDITO = "C"
	
	static String BASICO = "BASICO"
	static String COMPLETO = "COMPLETO"
	
	static int META_ATINGIDA = 1
	static int META_CORRENTE = 0
	static int META_PERDIDA = 2
	
	static String getFORMATO_MOEDA(){
						
		NumberFormat cf = NumberFormat.getCurrencyInstance()
		DecimalFormat df = (DecimalFormat) cf
		DecimalFormatSymbols dfs = df.getDecimalFormatSymbols()
		dfs.setCurrencySymbol ""
		
		df.setDecimalFormatSymbols dfs
		
		String pattern = df.toPattern()

		pattern
	}
}
