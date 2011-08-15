package com.cashbuilder

class OrcmItem {
 
	Categoria categoria
	Subcategoria subcategoria
	double valorPrevisto
	
	static belongsTo = [mes: OrcmMes]
	
    static constraints = {
		categoria(nullable:false)
		subcategoria(nullable:false)
		valorPrevisto(blank:false, scale:2)
    }
}
