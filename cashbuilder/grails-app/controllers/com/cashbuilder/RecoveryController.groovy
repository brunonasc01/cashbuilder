package com.cashbuilder

import org.joda.time.LocalDateTime;

class RecoveryController {

    def index() { }
	
	def send(){
		def email = params.email
		
		def user = User.findByEmail(email)
		
		if(user){
			Random rand = new Random()
			LocalDateTime ldt = new LocalDateTime()
			LocalDateTime expDtate = ldt.plusHours(2)
			
			String key = rand.nextInt(5)+"${user.id}"+expDtate.toString()
			String token = Encoder.encodeAndNormalize(key)
			
			new Recovery(user: user,token: token, expirationDate: expDtate).save()
		} else {
			flash.message="form.lostpassword.error"
			render(view:"index")
		}
	}
}
