package com.cashbuilder

import org.joda.time.LocalDateTime;

class RecoveryController {

    def index() {
	
		def user = User.findByEmail("test@net.com")	
		
		if(user){
			Random rand = new Random()			
			LocalDateTime ldt = new LocalDateTime()
			LocalDateTime expDtate = ldt.plusHours(2)
			
			String key = rand.nextInt(5)+"${user.id}"+expDtate.toString()
			String token = Encoder.encode(key)
			
			new Recovery(user: user,token: token, expirationDate: expDtate).save()
		}
	}
}
