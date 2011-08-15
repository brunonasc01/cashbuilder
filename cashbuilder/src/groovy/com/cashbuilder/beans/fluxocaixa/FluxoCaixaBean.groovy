package com.cashbuilder.beans.fluxocaixa

class FluxoCaixaBean {
	
	def pagamentos
	double entradas
	double saidas
	double saldo
	
	public double getSaldo(){
		return entradas - saidas
	}
}
