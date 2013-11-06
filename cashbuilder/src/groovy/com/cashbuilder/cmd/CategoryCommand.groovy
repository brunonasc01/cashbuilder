package com.cashbuilder.cmd

import grails.validation.Validateable;
import java.util.List;
import org.apache.commons.collections.functors.InstantiateFactory;
import org.apache.commons.collections.list.LazyList;

@Validateable
class CategoryCommand {

	String name
	boolean income
	boolean custom = true
	List<SubcategoryCommand> subcategories = LazyList.decorate(new ArrayList(),new InstantiateFactory(SubcategoryCommand.class))
	
	static constraints = {
		name(blank: false, size:3..20)
	}
}
