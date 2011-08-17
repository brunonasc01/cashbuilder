package com.cashbuilder

class Perfil {

	String nomeCompleto
	String cidade
	String estado
	String pais
	boolean primeiroLogin
	
	static belongsTo = [usuario: Usuario]
	
	static constraints = {
		nomeCompleto(nullable: true, maxLength:40)		
		cidade(nullable: true)
		estado(nullable: true)
		cidade(nullable: true)
		pais(nullable: true)
	}
}
