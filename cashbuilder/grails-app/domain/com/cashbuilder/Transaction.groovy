package com.cashbuilder

class Transaction {
	
	Date date
	String nature
	String description
	Category category
	Subcategory subcategory
	int parcels
	double value

	static belongsTo = [user: User]
	
    static constraints = {
		date(blank: false)
		category(nullable:false)
		subcategory(nullable:false)
		value(blank:false, scale:2,
			validator: { val ->
					if( val in String || val <= 0 )
						return ['empty']
			})
		parcels(blank:false, min:1,
			validator: { val ->
					if( val in String )
						return ['empty']
			})
    }
}
