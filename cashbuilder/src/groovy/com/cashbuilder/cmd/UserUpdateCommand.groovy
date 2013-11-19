package com.cashbuilder.cmd

import com.cashbuilder.User;

import grails.validation.Validateable

@Validateable
class UserUpdateCommand {
	
	String firstName
	String lastName
	String state
	String city

	static constraints = {
		importFrom User
		
		state(blank: false)
		city(blank: false)
	}
}
