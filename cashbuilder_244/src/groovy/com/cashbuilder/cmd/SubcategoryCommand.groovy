package com.cashbuilder.cmd

import grails.validation.Validateable;

@Validateable
class SubcategoryCommand {

	String name
	
	static constraints = {
		name(size:3..30,blank:false)
	}
}
