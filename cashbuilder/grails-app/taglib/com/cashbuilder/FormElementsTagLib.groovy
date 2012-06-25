package com.cashbuilder

class FormElementsTagLib {
	static namespace = "fe"
	
	def element = { attrs ->
		
		def name = attrs.name
		def bean = attrs.bean
		def type = attrs.type?: "text"
		def compulsory = attrs.compulsory?: ""
		def buffer = ""
		
		buffer <<= "<li class='label ${hasErrors(bean: bean, field: name, 'label-error')}'>"
		buffer <<=		g.message(code:"${name}.label")+"${compulsory}"
		buffer <<= "</li>"
		buffer <<= "<li class='input ${hasErrors(bean: bean, field: name, 'input-error')}'>"
		
		if(type.equals("text")){		
			buffer <<= g.textField(name:"${name}",value:bean?."${name}")
		} else if(type.equals("password")) {
			buffer <<= g.passwordField(name:"${name}")
		}
	
		buffer <<= "</li>"
				
		out << buffer
	}
}
