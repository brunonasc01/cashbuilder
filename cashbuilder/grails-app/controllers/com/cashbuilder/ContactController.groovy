package com.cashbuilder

import com.cashbuilder.beans.ContactSubjectBean;
import com.cashbuilder.cmd.ContactCommand;

class ContactController {
	
	def generalService
	def mailService

    def index() {
		def contact = new ContactCommand()
		boolean userLogged = session.user

		[contact: contact, userLogged: userLogged]
	}

	def submit(ContactCommand contact){

		boolean userLogged = session.user

		if(userLogged){
			def user = session.user.attach()
			contact.name = user.firstName
			contact.email = user.email
		}

		contact.subject = "FazRico.com - Mensagem de: ${contact.name}"

		if(contact.validate()){
			mailService.sendMail {
				to Constants.SUPPORT_MAIL
				subject contact.subject
				html contact.message
			}
			
			generalService.buildMessage(Constants.MSG_SUCCESS,"form.contact.message.success")
			
			if(userLogged){
				redirect(controller:"home")
			} 
		} else {
			generalService.buildMessage(Constants.MSG_ERROR,"form.contact.message.error")
			render(view: "index",model:[contact: contact, userLogged: userLogged])
		}
	}
}
