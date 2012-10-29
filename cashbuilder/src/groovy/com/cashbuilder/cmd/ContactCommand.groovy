package com.cashbuilder.cmd

import grails.validation.Validateable;

@Validateable
class ContactCommand {

	String name
	String email
	String subject
	String message

	static constraints = {

		email(email: true, blank:false)
		name(size:3..20, blank:false)
		subject(blank:false)
		message(blank:false)
	}
}
