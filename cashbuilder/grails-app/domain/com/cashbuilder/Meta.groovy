package com.cashbuilder

class Meta {

	String nome
	String descricao
	Date dataInicio
	Date dataFim
	
	static hasMany = [subcategorias: Subcategoria]
	    	
	static belongsTo = [user: Usuario]
	
	static constraints = {
		
		nome(unique:true, blank: false, size:3..50)
		descricao(size:10..200)
		dataInicio(nullable:false)
		dataFim(nullable:false)		
		subcategorias(nullable:false)
	}
}
