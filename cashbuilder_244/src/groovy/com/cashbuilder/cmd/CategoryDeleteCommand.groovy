package com.cashbuilder.cmd

import grails.validation.Validateable;

@Validateable
class CategoryDeleteCommand {

	String newId
	List<SubcategoryDeleteCommand> newSubcategories = [].withLazyDefault { new SubcategoryDeleteCommand() }
	
	static constraints = {
		newId(blank:false, 
			validator: { val ->
				if( val == "" || val == null )
					return ['empty']
			})
	}
}
