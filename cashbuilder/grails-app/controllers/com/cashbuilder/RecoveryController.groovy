package com.cashbuilder

import org.joda.time.LocalDateTime;

import com.cashbuilder.cmd.RecoveryCommand;

class RecoveryController {

	def generalService
	def mailService
	
	static allowedMethods = [send: "POST"]
	
    def index() {
		def token = params.token

		if(token){
			def recovery = Recovery.findByToken(token)
			
			if(recovery){
				RecoveryCommand rcmd = new RecoveryCommand(token: token) 
				
				[recovery: true, bean: rcmd]
			}
		}
			
	}
	
	def send(){
		def email = params.email
		
		def user = User.findByEmail(email)
		
		if(user){
			Random rand = new Random()
			LocalDateTime ldt = new LocalDateTime()
			LocalDateTime expDate = ldt.plusHours(2)

			String key = rand.nextInt(5)+"${user.id}"+expDate.toString()
			String token = Encoder.encodeAndNormalize(key)

			def recovery = new Recovery(user: user,token: token, expirationDate: expDate.toDate())
			recovery.save()

			mailService.sendMail {
				to user.email
				subject g.message(code:"recovery.password.mail.subject")
				html g.render(template:"/elements/mail/request_password", model:[username:user.firstName,token:token])				
			}

			generalService.buildMessage(Constants.MSG_INFO,"form.lostpassword.message.send")
		} else {
			generalService.buildMessage(Constants.MSG_ERROR,"form.lostpassword.error")
			render(view:"index")
		}
	}
	
	def reset(RecoveryCommand rcmd){
		if(rcmd.validate()){

			def recovery = Recovery.findByToken(rcmd.token)

			if(recovery){
				def user = recovery.user
				user.password = Encoder.encode(rcmd.passwordNew)
				
				recovery.delete()
				
				generalService.buildMessage(Constants.MSG_SUCCESS,"form.resetpassword.message.success")
			}
		} else {
			generalService.buildMessage(Constants.MSG_ERROR,"form.resetpassword.error")
			render(view: "index",model:[bean:rcmd,recovery: true])
		}
	}
}
