package com.cashbuilder

class JqueryDatePickerTagLib { 
	
	def jqDatePicker =  { attrs, body ->
		def name = attrs.name
		def value = attrs.value
		
		Calendar cal = Calendar.getInstance()
		def date = ""
		
		if(value){
			cal.setTime(value)
			date = cal.format("dd/MM/yyyy")
		}

		//Create date text field and supporting hidden text fields need by grails
		out << "<input type='text' name='${name}_input' id='${name}_input' value='${date}' readonly='true' />"
		out << "<input type='hidden' name='${name}' id='${name}' value='date.struct'/>"
		out << "<input type='hidden' name='${name}_minute' id='${name}_minute' value='${cal.get(Calendar.MINUTE)}' />"
		out << "<input type='hidden' name='${name}_hour' id='${name}_hour' value='${cal.get(Calendar.HOUR_OF_DAY)}' />"
		out << "<input type='hidden' name='${name}_day' id='${name}_day' value='${value? cal.get(Calendar.DATE) : ''}' />"
		out << "<input type='hidden' name='${name}_month' id='${name}_month' value='${value? cal.get(Calendar.MONTH)+1 : ''}'/>"
		out << "<input type='hidden' name='${name}_year' id='${name}_year' value='${value? cal.get(Calendar.YEAR) : ''}'/>"

		//Code to parse selected date into hidden fields required by grails
		out << "<script type='text/javascript'> \$(function(){"
		out << "\$('#${name}_input').datepicker({"	
		out << "onSelect: function(dateText, inst) {"
		out << "\$('#${name}_day').attr('value',\$(this).datepicker('getDate').getDate());"
		out << "\$('#${name}_month').attr('value',\$(this).datepicker('getDate').getMonth() +1);"
		out << "\$('#${name}_year').attr('value',\$(this).datepicker('getDate').getFullYear());"
		out << "}"
		out << "});"
		out << "})</script>"
	}
}