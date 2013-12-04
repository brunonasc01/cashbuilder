package com.cashbuilder.cmd

import org.apache.commons.collections.functors.InstantiateFactory;
import org.apache.commons.collections.list.LazyList;

import grails.validation.Validateable;

@Validateable
class CategoryDeleteCommand {

	String newId
	List<SubcategoryDeleteCommand> newSubcategories = LazyList.decorate(new ArrayList(),new InstantiateFactory(SubcategoryDeleteCommand.class))
	
	static constraints = {
		newId(blank:false, 
			validator: { val ->
				if( val == "" || val == null )
					return ['empty']
			})
	}
}
