package com.cashbuilder

import com.cashbuilder.beans.ContactSubjectBean;
import com.cashbuilder.cmd.ContactCommand;

class ContactController {
	
	def generalService
	def mailService

    def index() {
		def contact = new ContactCommand()
		def subjects = []
		
		boolean userLogged = session.user
		
		subjects += new ContactSubjectBean(id: "sugestion", value: g.message(code:"contact.subject1"))
		subjects += new ContactSubjectBean(id: "error", value: g.message(code:"contact.subject2"))
		subjects += new ContactSubjectBean(id: "interface", value: g.message(code:"contact.subject3"))
		subjects += new ContactSubjectBean(id: "others", value: g.message(code:"contact.subject4"))
		
		[contact: contact, subjects: subjects, userLogged: userLogged]
	}
	
	def contact() {
		def contact = new ContactCommand()
		def subjects = []
		
		boolean userLogged = session.user
		
		subjects += new ContactSubjectBean(id: "sugestion", value: g.message(code:"contact.subject1"))
		subjects += new ContactSubjectBean(id: "error", value: g.message(code:"contact.subject2"))
		subjects += new ContactSubjectBean(id: "interface", value: g.message(code:"contact.subject3"))
		subjects += new ContactSubjectBean(id: "others", value: g.message(code:"contact.subject4"))
		
		[contact: contact, subjects: subjects, userLogged: userLogged]
	}
	
	def submitContact(ContactCommand contact){
		
		boolean userLogged = session.user
		
		if(userLogged){
			def user = session.user.attach()
			contact.name = user.firstName
			contact.email = user.email
		}
		
		if(contact.validate()){
			
			mailService.sendMail {
				to Constants.SUPPORT_MAIL
				subject contact.subject
				html contact.message
			}
			
			generalService.buildMessage(Constants.MSG_SUCCESS,"form.contact.data.success.message")
			
			if(userLogged){
				redirect(controller:"home")
			} else {
				redirect(action:"index")
			}
			
		} else {
			generalService.buildMessage(Constants.MSG_ERROR,"form.contact.data.error.message")
		}		
		
		def subjects = []
		
		subjects += new ContactSubjectBean(id: "sugestion", value: g.message(code:"contact.subject1"))
		subjects += new ContactSubjectBean(id: "error", value: g.message(code:"contact.subject2"))
		subjects += new ContactSubjectBean(id: "interface", value: g.message(code:"contact.subject3"))
		subjects += new ContactSubjectBean(id: "others", value: g.message(code:"contact.subject4"))
		
		render(view: "index",model:[contact: contact, subjects: subjects, userLogged: userLogged])
	}
}
