package com.cashbuilder.cmd

import com.cashbuilder.Profile;
import com.cashbuilder.User;

import grails.validation.Validateable

@Validateable
class UserUpdateCommand {
	
	String firstName
	String lastName
	String passwordRepeat
	Profile profile

	static constraints = {
		importFrom User
	}
}
