package com.cashbuilder

class Categoria {

	String nome
	boolean receita
	
    static constraints = {
		nome(unique:true, blank: false, size:3..20)
    }

	static hasMany = [subcategorias: Subcategoria]
	
	String toString(){
		"${nome}"
	}
	
	static mapping = {
		subcategorias sort: 'nome'
		sort nome: "asc"
	}
	
	static belongsTo = [user: Usuario]
}
