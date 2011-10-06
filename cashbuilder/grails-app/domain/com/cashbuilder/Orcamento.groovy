package com.cashbuilder

class Orcamento {

	Integer ano	
	boolean calculated
	
	static belongsTo = [user: Usuario]
	
	static hasMany = [meses: OrcmMes, alerts: Alert]
	
    static constraints = {
		ano(blank:false)
		calculated(nullable:true)
    }

	static mapping = {		
		meses sort: 'mes'
	}
	
	String toString(){
		"Orcamento: ${ano}" 
	}
}
