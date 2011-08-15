package com.cashbuilder

import com.cashbuilder.utils.DateUtils;

class OrcmMes {

	Integer mes

	static belongsTo = [orcamento: Orcamento]
	
	static hasMany = [itens: OrcmItem]
	
    static constraints = {
		mes(size:0..11)
    }

	static mapping = {
		sort mes: "asc" 
	}
	
	String toString(){
		"${DateUtils.getMes(mes)}"
	}
}
