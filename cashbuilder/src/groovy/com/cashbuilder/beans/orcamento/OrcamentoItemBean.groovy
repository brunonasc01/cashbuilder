package com.cashbuilder.beans.orcamento

class OrcamentoItemBean {

	String nome
	double valorPrevisto
	double valorRealizado
	def subcategorias
	
	public double getPorcentagem(){
		return (valorRealizado / valorPrevisto)*100
	}
}
