package com.cashbuilder

class Subcategoria {

	String nome
	
    static constraints = {
    }

	static belongsTo = [categoria: Categoria]
	
	String toString(){
		"${nome}"
	}
	
	static mapping = {
		
		sort nome: "asc"
	}
}
