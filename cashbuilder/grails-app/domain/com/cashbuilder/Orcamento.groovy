package com.cashbuilder

class Orcamento {

	Integer ano	

    static constraints = {
    }
	
	static hasMany = [meses: OrcmMes]
	
	
	static mapping = {		
		meses sort: 'mes'
	}
	
	String toString(){
		"Orcamento: ${ano}" 
	}

	static belongsTo = [user: Usuario]
}
