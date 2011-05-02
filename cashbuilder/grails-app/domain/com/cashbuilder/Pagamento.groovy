package com.cashbuilder

import com.cashbuilder.utils.DateUtils;

class Pagamento {

	static searchable = {
		spellCheck "include"
	}
	
	Date data
	double valor
	String natureza
	String descricao
	Categoria categoria
	Subcategoria subcategoria
	
    static constraints = {
		
		categoria(nullable:true)
		subcategoria(nullable:true)
    }
	
	static belongsTo = [user: Usuario]
		
	
}
