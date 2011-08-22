package com.cashbuilder

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;

class GeralService {

    static transactional = true

    def serviceMethod() {

    }
	
	/**
	 * Reorna o total de pagamentos feitos num determinado intervalo de tempo
	 * @param usuario o usuario
	 * @param dataInicial a data inicial
	 * @param dataFinal a data final
	 * @param natureza a natureza do pagamento
	 * @return o total de pagamentos
	 */
	double getTotalPagamentos(Usuario usuario, Date dataInicial, Date dataFinal, String natureza){
		
		double total = Pagamento.createCriteria().get {
			and {
				eq('user', usuario)
				eq('natureza', natureza)
				between('data', dataInicial, dataFinal)
			}
			projections { sum "valor" }
		}

		(total)? total : 0
	}
	
	/**
	 * Obtem o formatador de numeros 
	 * @return o formatador numerico
	 */
	DecimalFormat getFormatadorNumerico(){
		NumberFormat cf = NumberFormat.getCurrencyInstance()
		DecimalFormat df = (DecimalFormat) cf
		DecimalFormatSymbols dfs = df.getDecimalFormatSymbols()
		dfs.setCurrencySymbol ""
		df.setDecimalFormatSymbols dfs
		
		df
	}
}
