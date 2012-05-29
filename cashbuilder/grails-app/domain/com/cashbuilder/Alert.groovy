package com.cashbuilder

class Alert {

	int type
	String message
	boolean enable

	static belongsTo = [budget: Budget]
	
    static constraints = {
		type(unique: true,blank: false)
		message(blank: false)
    }
}
