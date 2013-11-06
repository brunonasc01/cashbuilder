package com.cashbuilder.cmd

import grails.validation.Validateable;

@Validateable
class SubcategoryDeleteCommand {

	def id
	
	static belongsTo = [category: CategoryDeleteCommand]
	
	static constraints = {
		id(blank:false,
			validator: { val ->
				if( val == "" || val <= 0 || val == null )
					return ['empty']
			})
	}
}
