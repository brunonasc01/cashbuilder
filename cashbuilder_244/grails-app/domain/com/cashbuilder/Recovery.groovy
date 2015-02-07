package com.cashbuilder

import java.util.Date;

class Recovery {

	String token
	Date expirationDate
	static belongsTo = [user: User]
	
    static constraints = {
		token(unique:true,blank:false)
		expirationDate(blank: false)
    }
}
