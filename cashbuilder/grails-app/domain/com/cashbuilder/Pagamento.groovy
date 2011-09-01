package com.cashbuilder

class Pagamento {
	
	Date data
	double valor
	String natureza
	String descricao
	Categoria categoria
	Subcategoria subcategoria
	
	static belongsTo = [user: Usuario]
	
    static constraints = {
		
		data(blank: false)
		valor(blank:false, scale:2)
		categoria(nullable:false)
		subcategoria(nullable:false)
    }
}
