package com.cashbuilder

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;

class Constants {

	static String SUPPORT_MAIL = "suporte@fazrico.com"
	
	static String DEBITO = "D"
	static String CREDITO = "C"
	
	static String BASICO = "BASICO"
	static String COMPLETO = "COMPLETO"
	
	static int META_ATINGIDA = 1
	static int META_CORRENTE = 0
	static int META_PERDIDA = 2
	
	static int ALERT_SALDO_POSITIVO = 0
	static int ALERT_SALDO_NEGATIVO = 1
	static int ALERT_ORCAMENTO_NEGATIVO = 2
	
	static String POSITIVE = "positive"
	static String NEGATIVE = "negative"
	
	static String getFORMATO_MOEDA(){
						
		NumberFormat cf = NumberFormat.getCurrencyInstance()
		DecimalFormat df = (DecimalFormat) cf
		DecimalFormatSymbols dfs = df.getDecimalFormatSymbols()
		dfs.setCurrencySymbol ""
		
		df.setDecimalFormatSymbols dfs
		
		String pattern = df.toPattern()

		pattern
	}
	
	static String[] graphColors = ["AFD8F8","F6BD0F","8BBA00","FF8E46","008E8E","D64646","8E468E","588526","B3AA00","008ED6","9D080D","A186BE","CC6600","FDC689","ABA000","F26D7D","FFF200","0054A6","F7941C","CC3300","006600","663300","6DCFF6"]
}
