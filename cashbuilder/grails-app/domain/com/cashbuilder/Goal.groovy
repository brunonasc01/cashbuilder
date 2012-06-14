package com.cashbuilder

import java.util.Date;

class Goal {

    String title
	Date startDate
	Date endDate
	double total
	boolean finished
	
	static belongsTo = [user: User]
	
	static hasMany = [subcategories: Subcategory]

	static constraints = {
		
		title(unique:true, blank:false, size:10..45)
		startDate(blank:false)
		endDate(blank:false)		
		total(scale:2,
			validator: { value ->
				if( value in String || value <= 0 )
					return ['empty']
			})
		subcategories(nullable:false)
	}
}
