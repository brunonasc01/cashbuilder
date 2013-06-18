package com.cashbuilder

class AjaxEffectsTagLib {

	def validateForm = { attrs ->
		def project = '/'
		def default_action = 'validator'

		def form = attrs.form
		def controller = attrs.controller
		def action = attrs.action?: default_action
		def onTop = attrs.onTop?: false;
		
		out << "<script>"
		out << "\$(document).ready(function(){"
		out << "ajaxValidate('${project}${controller}/${action}','${form}',${onTop});"
		out << "});"
		out << "</script>"
	}
	
	def dgCidadesEstados = { attrs ->
		
		def sel_estado = attrs.estado
		def sel_cidade = attrs.cidade
		def estado_val = attrs.estado_valor?: "Selecione"
		def cidade_val = attrs.cidade_valor?: ""
		
		out << "<script src='http://cidades-estados-js.googlecode.com/files/cidades-estados-1.2-utf8.js'></script>"
		
		out << "<script>"
		out << "\$(document).ready(function(){"
		out << "new dgCidadesEstados({"
		out << "estado: \$('#${sel_estado}').get(0),"
		out << "cidade: \$('#${sel_cidade}').get(0),"
		out << "estadoVal: '${estado_val}',"
		out << "cidadeVal: '${cidade_val}',"
		out << "change: true"
		out << "});"
		out << "});"
		out << "</script>"
	}
	
	def categoriesCombo = { attrs ->
		def project = '/category/'
		def default_action = 'selectedCategory'

		def categoryCombo = attrs.category
		def subcategoryCombo = attrs.subcategory
		def action = attrs.action?: default_action

		out << "<script>"
		out << "\$(document).ready(function(){"
		out << "ajaxSubcategoryCombo('${project}${action}', '${categoryCombo}', '${subcategoryCombo}');"
		out << "});"
		out << "</script>"
	}
}
