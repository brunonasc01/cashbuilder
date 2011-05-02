package com.cashbuilder

class OrcmItem {
 
	Categoria categoria
	Subcategoria subcategoria
	double valorPrevisto
	
    static constraints = {
    }
	
	static belongsTo = [mes: OrcmMes]
}
