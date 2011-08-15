package com.cashbuilder

class Orcamento {

	Integer ano	

	static belongsTo = [user: Usuario]
	
	static hasMany = [meses: OrcmMes]
	
    static constraints = {
		ano(blank:false)
    }

	static mapping = {		
		meses sort: 'mes'
	}
	
	String toString(){
		"Orcamento: ${ano}" 
	}
}
