package com.cashbuilder.cmd

import grails.validation.Validateable;

@Validateable
class SubcategoryDeleteCommand {

	def id
	
	static belongsTo = [category: CategoryDeleteCommand]
}
