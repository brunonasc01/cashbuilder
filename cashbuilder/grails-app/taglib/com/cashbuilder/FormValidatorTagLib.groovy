package com.cashbuilder

class FormValidatorTagLib {

	static namespace = "fv"
	
	def textInput = { attrs ->
		attrs.type = "text"		
		out << formatField(attrs)
	}
	
	def textInputShort = { attrs ->
		attrs.type = "text"
		out << formatFieldShort(attrs)
	}
	
	def passwordInput = { attrs ->
		attrs.type = "password"
		out << formatField(attrs)
	}
	
	def passwordInputShort = { attrs ->
		attrs.type = "password"
		out << formatFieldShort(attrs)
	}
	
	def submitButton = { attrs ->
		attrs.type = "submit"
		out << formatSubmit(attrs)
	}
	
	String formatSubmit(attrs){
		
		def builder = ""
		builder <<= "<div id='submitField'>"
		builder <<=		"<div class='span-3 prepend-4'>"
		builder <<=			generateInput(attrs)
		builder <<=		"</div>"
		builder <<=		"<div class='clear'></div>"
		builder <<=		"<div class='alert-msg span-8 prepend-4 last'></div>"
		builder <<= "</div>"
		
		builder
	}

	String formatField(attrs){
		
		def fieldName = attrs.name		
				
		def builder = ""
		builder <<= "<div id='field'>"
		builder <<=		"<div class='form-label span-4'>"
		builder <<=			"<label>"
		builder <<=				g.message(code:"${fieldName}.label",default:"${fieldName}")
		builder <<=			"</label>"
		builder <<=		"</div>"
		builder <<=		"<div class='form-input span-4'>"
		builder <<=			generateInput(attrs)
		builder <<=		"</div>"
		builder <<=		"<div class='form-msg span-8 last'></div>"
		builder <<= "</div>"
		builder <<= "<div class='clear'></div>"
		
		builder
	}
	
	String formatFieldShort(attrs){
		
		def fieldName = attrs.name
				
		def builder = ""
		builder <<= "<div id='field'>"
		builder <<=		"<div class='form-label span-2'>"
		builder <<=			"<label>"
		builder <<=				g.message(code:"${fieldName}.label",default:"${fieldName}")
		builder <<=			"</label>"
		builder <<=		"</div>"
		builder <<=		"<div class='form-input span-5 last'>"
		builder <<=			generateInput(attrs)
		builder <<=		"</div>"
		builder <<=		"<div class='form-msg-short span-7 prepend-1'></div>"
		builder <<= "</div>"
		builder <<= "<div class='clear'></div>"
		
		builder
	}
	
	String generateInput(attrs){

		if("text".equals(attrs.type)){
			g.textField(attrs)
			
		} else if("password".equals(attrs.type)){
			g.passwordField(attrs)

		} else if("submit".equals(attrs.type)){
			g.submitButton(attrs)
		}
	}
}
