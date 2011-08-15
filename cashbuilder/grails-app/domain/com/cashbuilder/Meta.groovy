package com.cashbuilder

class Meta {

	String nome
	String descricao
	Date dataInicio
	Date dataFim
	double valorAlmejado
	boolean finalizado
	
	static belongsTo = [user: Usuario]
	
	static hasMany = [subcategorias: Subcategoria]

	static constraints = {
		
		nome(unique:true, blank:false, size:3..50)
		descricao(size:10..200)
		dataInicio(blank:false)
		dataFim(blank:false)		
		valorAlmejado(scale:2, blank:false)
		subcategorias(nullable:false)
	}
}
