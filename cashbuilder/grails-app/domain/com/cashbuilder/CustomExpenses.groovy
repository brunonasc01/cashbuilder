package com.cashbuilder

class CustomExpenses {

	String name
	boolean enabled
	
	static belongsTo = [profile : Profile]
	
    static constraints = {
		name(blank:false)
    }
}
