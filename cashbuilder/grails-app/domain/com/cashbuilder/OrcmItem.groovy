package com.cashbuilder

class OrcmItem {
 
	Categoria categoria
	Subcategoria subcategoria
	int valorPrevisto
	
    static constraints = {
    }
	
	static belongsTo = [mes: OrcmMes]
}
