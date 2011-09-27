package com.cashbuilder

class Perfil {

	String nomeCompleto
	String cidade
	String estado
	String pais
	boolean primeiroLogin
	
	static belongsTo = [usuario: Usuario]
	
	static constraints = {
		nomeCompleto(blank: false, maxLength:40)		
		cidade(blank: false)
		estado(blank: false)
		pais(blank: false)
	}
}
