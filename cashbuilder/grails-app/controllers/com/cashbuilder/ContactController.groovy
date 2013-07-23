package com.cashbuilder

import com.cashbuilder.beans.ContactSubjectBean;
import com.cashbuilder.cmd.ContactCommand;

class ContactController {
	
	def generalService
	def mailService

    def index() {
		def contact = new ContactCommand()
		def subjects = []
		
		subjects += new ContactSubjectBean(id: "sugestion", value: g.message(code:"contact.subject1"))
		subjects += new ContactSubjectBean(id: "error", value: g.message(code:"contact.subject2"))
		subjects += new ContactSubjectBean(id: "interface", value: g.message(code:"contact.subject3"))
		subjects += new ContactSubjectBean(id: "others", value: g.message(code:"contact.subject4"))
		
		[contact: contact, subjects: subjects]
	}
	
	def submitContact(ContactCommand contact){
		if(contact.validate()){
			
			mailService.sendMail {
				to Constants.SUPPORT_MAIL
				subject contact.subject
				html contact.message
			}
			
			generalService.buildMessage(Constants.MSG_SUCCESS,"form.contact.data.success.message")
			redirect(action:"index")
		} else {
			generalService.buildMessage(Constants.MSG_ERROR,"form.contact.data.error.message")
		}		
		
		def subjects = []
		
		subjects += new ContactSubjectBean(id: "sugestion", value: g.message(code:"contact.subject1"))
		subjects += new ContactSubjectBean(id: "error", value: g.message(code:"contact.subject2"))
		subjects += new ContactSubjectBean(id: "interface", value: g.message(code:"contact.subject3"))
		subjects += new ContactSubjectBean(id: "others", value: g.message(code:"contact.subject4"))
		
		render(view: "index",model:[contact: contact, subjects: subjects])
	}
}
