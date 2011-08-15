package com.cashbuilder

class Categoria {

	String nome
	boolean receita
	
	static belongsTo = [user: Usuario]
	
	static hasMany = [subcategorias: Subcategoria]
	
    static constraints = {
		nome(blank: false, size:3..20)
    }

	static mapping = {
		subcategorias sort: 'nome'
		sort nome: "asc"
	}
	
	String toString(){
		"${nome}"
	}
}
