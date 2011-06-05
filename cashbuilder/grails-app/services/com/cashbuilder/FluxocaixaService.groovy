package com.cashbuilder

import java.text.DecimalFormat;

import com.cashbuilder.utils.DateUtils;

class FluxocaixaService {

    static transactional = true

    def serviceMethod() {

    }
	
	/**
	* Calcula o saldo Realizado
	* @return o saldo realizado
	*/
	double calcSaldo(OrcmMes mes,Usuario user){
		
		int _mes = mes.mes
		int _ano = mes.orcamento.ano
		Date firstDate = DateUtils.getFirstDate(_mes, _ano)
		Date lastDate = DateUtils.getLastDate(_mes,_ano)
		
		def pagamentos = Pagamento.createCriteria().list {
			and {
				eq('user', user)
				between('data', firstDate, lastDate)
			}
		}
		
		double saldo = 0
		double entradas = 0
		double saidas = 0
		
		if(pagamentos){
			pagamentos.each { pg ->
				if(pg.natureza.equals("C")){
					entradas += pg.valor
				}else {
					saidas += pg.valor
				}
			}
		}
 
		saldo = entradas - saidas
		
		return saldo
	}
	
	/**
	* Calcula o Total de Debitos ou Credito em um Mes
	* @return o total
	*/
	double calcTotal(OrcmMes mes,Usuario user,boolean credito){
		
		int _mes = mes.mes
		int _ano = mes.orcamento.ano
 
		Date firstDate = DateUtils.getFirstDate(_mes, _ano)
		Date lastDate = DateUtils.getLastDate(_mes,_ano)
 
		def pagamentos = Pagamento.createCriteria().list {
			and {
				eq('user', user)
				between('data', firstDate, lastDate)
			}
		}

		double total = 0
		String tipo = credito? "C" : "D";
				
		if(pagamentos){
			pagamentos.each { pg ->
				if(pg.natureza.equals(tipo)){
					total += pg.valor
				}
			}
		}
 
		return total
	}
}
