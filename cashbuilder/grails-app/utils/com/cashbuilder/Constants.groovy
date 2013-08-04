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
	
	static final String MSG_SUCCESS = "success"
	static final String MSG_ERROR = "error"
	static final String MSG_INFO = "info"

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
