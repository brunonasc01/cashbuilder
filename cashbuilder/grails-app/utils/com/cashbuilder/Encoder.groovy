package com.cashbuilder

import java.security.MessageDigest;

class Encoder {

	static encode = { str ->
		MessageDigest md = MessageDigest.getInstance('MD5')
		md.update(str.getBytes())
		md.digest().encodeBase64()
	}
}
