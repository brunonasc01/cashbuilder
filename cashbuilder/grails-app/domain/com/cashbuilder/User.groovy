package com.cashbuilder

import java.util.Date;

class User {

	String email
	String firstName
	String lastName
	String password
	Date dateCreated
	Profile profile

	static hasMany = [budgets: Budget, categories: Category, transactions: Transaction, goals: Goal]
	
    static constraints = {
		email(email: true, unique:true,blank:false)
		firstName(size:3..20,blank:false)
		lastName(size:3..30,blank:false)
		password(blank:false,minSize:6,
				Validator: { passwd, user ->
						return passwd != user.firstName
					})
    }
	
	static mapping = { 
		profile cascade: 'all'
	}
}
