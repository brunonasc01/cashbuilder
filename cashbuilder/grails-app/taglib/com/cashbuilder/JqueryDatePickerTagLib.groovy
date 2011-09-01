package com.cashbuilder

class JqueryDatePickerTagLib { 
	
	def jqDatePicker =  { attrs, body ->
		def out = out
		def name = attrs.name    //The name attribute is required for the tag to work seamlessly with grails
		def id = attrs.id ?: name
		def minDate = attrs.minDate
		def showDay = attrs.showDay
		def value = attrs.value
		
		Calendar cal = Calendar.getInstance()
		def date = ""
		
		if(value){
			def c = new GregorianCalendar()
			c.setTime(value)
			date = c.format("MM/dd/yyyy")
		}

		//Create date text field and supporting hidden text fields need by grails
		out.println "<input type='text' name='${name}' id='${id}' value='${date}' />"
		out.println "<input type='hidden' name='${name}_minute' id='${id}_minute' value='${cal.get(Calendar.MINUTE)}' />"
		out.println "<input type='hidden' name='${name}_hour' id='${id}_hour' value='${cal.get(Calendar.HOUR_OF_DAY)}' />"
		out.println "<input type='hidden' name='${name}_day' id='${id}_day' />"
		out.println "<input type='hidden' name='${name}_month' id='${id}_month' />"
		out.println "<input type='hidden' name='${name}_year' id='${id}_year' />"
		
		//Code to parse selected date into hidden fields required by grails
		out.println "<script type='text/javascript'> \$(document).ready(function(){"
		out.println "\$('#${name}').datepicker({"	
		out.println "onClose: function(dateText, inst) {"
		out.println "\$('#${name}_day').attr('value',new Date(dateText).getDate());"
		out.println "\$('#${name}_month').attr('value',new Date(dateText).getMonth() +1);"
		out.println "\$('#${name}_year').attr('value',new Date(dateText).getFullYear());"
		out.println "}"
		
		//If you want to customize using the jQuery UI events add an if block an attribute as follows
		
		if(minDate != null){	
			out.println ","
			out.println "minDate: ${minDate}"
		}
		
		if(showDay != null){
			out.println ","
			out.println "beforeShowDay: function(date){"
			out.println	"var day = date.getDay();"
			out.println	"return [day == ${showDay},\"\"];"
			out.println "}"	
		}
		
		out.println "});"
		out.println "})</script>"
	}
}