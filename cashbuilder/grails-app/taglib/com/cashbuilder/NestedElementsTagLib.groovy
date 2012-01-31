package com.cashbuilder

class NestedElementsTagLib {

	def monthMenu = { attrs ->
		out << render(template:"/elements/month_menu", model:[action:attrs.action, index:attrs.month])
	}
}
