package com.cashbuilder

import java.security.MessageDigest;

class Encoder {

	static encode = { str ->
		MessageDigest md = MessageDigest.getInstance('MD5')
		md.update(str.getBytes())
		md.digest().encodeBase64()
	}
	
	static encodeAndNormalize (String str) {
		String result = encode(str)
		
		result = result.replace("+","0")
		result = result.replace("=","0")
		result = result.replace("/","0")
	}
}
