package com.cashbuilder

class Profile {

	String city
	String state	
	boolean firstLogin
	
	static hasMany = [expenses: CustomExpenses]
	
	static belongsTo = User
	
    static constraints = {
		city(blank: false)
		state(blank: false)
    }
}
