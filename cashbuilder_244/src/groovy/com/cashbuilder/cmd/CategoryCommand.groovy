package com.cashbuilder.cmd

import grails.validation.Validateable;
import java.util.List;

@Validateable
class CategoryCommand {

	String name
	boolean income
	boolean custom = true
	List<SubcategoryCommand> subcategories = [].withLazyDefault { new SubcategoryCommand() }
	
	static constraints = {
		name(blank: false, size:3..20)
	}
}
