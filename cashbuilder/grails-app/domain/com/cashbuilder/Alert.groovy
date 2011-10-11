package com.cashbuilder

class Alert {

	int type
	String message
	boolean enable

	static belongsTo = [orcamento: Orcamento]
	
    static constraints = {
		type(unique: true,blank: false)
		message(blank: false)
    }
}
