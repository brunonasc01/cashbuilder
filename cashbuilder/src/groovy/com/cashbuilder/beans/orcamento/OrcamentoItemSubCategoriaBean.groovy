package com.cashbuilder.beans.orcamento

class OrcamentoItemSubCategoriaBean {

	def orcmItem
	double valorRealizado

	public String getNome(){
		orcmItem?.subcategoria.nome
	}
	
	public double getValorPrevisto(){
		orcmItem?.valorPrevisto
	}
}
