package com.cashbuilder.beans.fluxocaixa

import com.cashbuilder.beans.DateBean;

class FluxoCaixaBean {
	
	DateBean date
	def pagamentos
	double entradas
	double saidas
	double saldo
	
	public double getSaldo(){
		return entradas - saidas
	}
}
