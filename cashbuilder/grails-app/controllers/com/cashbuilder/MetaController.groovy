package com.cashbuilder

import com.cashbuilder.beans.ListaCategoriasBean;
import com.cashbuilder.beans.meta.MetaBean;
import com.cashbuilder.utils.Constants;

class MetaController {

	def geralService
	def metaService
	
    def index = {
		
		def user = session.user.attach()
		def categoriesList = geralService.getCategoriesList(user)
		def listaMetas = metaService.getMetas(user)
		def goalResults = metaService.getGoalStats(user)
		
		[goal : true, listCategorias: categoriesList, metas: listaMetas, goalResults: goalResults ]
	}
		
	def save = {
		try {
			def user = session.user.attach()
			def newMeta = metaService.saveMeta(user, params.properties)
			flash.message = "Meta gravada com sucesso"
		} catch (RuntimeException re){
			flash.message = re.message
			println re.message
		}
		redirect(controller:"meta", action: "index")
	}

	def ajaxNovo = {
		
		def user = session.user.attach()
		def listaCategorias = geralService.getCategoriesList(user)
		
		render(view: "novo", model: [listCategorias: listaCategorias])
	}
		
	def validator = { Meta bean ->

		String fieldName = params.fieldName

		if(fieldName.indexOf(".") != -1){
			fieldName = fieldName.substring(0, fieldName.indexOf("."))
		} else if(fieldName.equals("valorAlmejado") || fieldName.equals("FORM")){
				
			if(!params.valorAlmejado || geralService.containsLetters(params.valorAlmejado)){
				bean.valorAlmejado = 0
				bean.clearErrors()
				bean.validate()
			}
		}

		if(fieldName.equals("FORM") && bean.hasErrors()){
			render "${message(code: 'default.form.error.message', default: 'error')}"
		} else if(fieldName && bean.errors.hasFieldErrors(fieldName)){
			render g.renderErrors(bean: bean,field: fieldName)
		}else {
			render ""
		}
	}
}
