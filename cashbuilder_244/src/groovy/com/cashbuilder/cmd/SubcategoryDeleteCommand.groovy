package com.cashbuilder.cmd

import grails.validation.Validateable;

@Validateable
class SubcategoryDeleteCommand {

	String id
	
	static belongsTo = [category: CategoryDeleteCommand]
	
	static constraints = {
		id(blank:false,
			validator: { val ->
				if( val == "" || val == null )
					return ['empty']
			})
	}
}
