package com.cashbuilder

class CustomExpenses {

	String name
	boolean enabled
	
	static belongsTo = [profile : Perfil]
	
    static constraints = {
		name(blank: false)
    }
}
