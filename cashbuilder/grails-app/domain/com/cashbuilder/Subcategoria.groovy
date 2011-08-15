package com.cashbuilder

class Subcategoria {

	String nome
	
	static belongsTo = [categoria: Categoria]
	
    static constraints = {
		nome(size:3..30,blank:false)
    }

	static mapping = {
		sort nome: "asc"
	}
	
	String toString(){
		"${nome}"
	}
}
