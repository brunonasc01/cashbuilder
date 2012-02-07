package com.cashbuilder

import com.cashbuilder.utils.Constants;

class PagamentoController {

	def geralService
	def paymentService
	
	static allowedMethods = [delete: "POST", update: "POST", save: "POST"]
	
	def save = {
		try {
			def user = session.user.attach()
			def newPayment = paymentService.savePayment(user, params)
			flash.message = "Pagamento gravado com sucesso"
		} catch (RuntimeException re){
			flash.message = re.message
		}
		redirect(controller:"fluxoCaixa", action: "index")
	}
	
	def delete = {
		try {
			paymentService.deletePayment(params.id)
			flash.message = "Registro excluido com sucesso"
		} catch(RuntimeException re) {
			flash.message = re.message
		}
		redirect(controller:"fluxoCaixa", action: "index")
	}

	def update = {
		try {
			paymentService.updatePayment(params.id,params.properties)
			flash.message = "Registro atualizado com sucesso."
		} catch(Exception e){
			flash.message = e.message
		}
		redirect(controller:"fluxoCaixa", action: "index")
	}
	
	def ajaxNovo = {		
		def user = session.user.attach()
		def categoriesList = geralService.getCategoriesList(user)
		render(view: "novo", model: [listCategorias: categoriesList])
	}

	def ajaxEdit = {
		def pagamento = Pagamento.get(params.id)
		
		if (!pagamento) {
			flash.message = "Nao foi possivel editar o pagamento, tente novamente"
			redirect(controller:"fluxoCaixa", action: "index")
		} else {
			def categoriesList = geralService.getCategoriesList(pagamento.user)
			def df = geralService.getFormatadorNumerico()
			render(view: "edit", model: [listCategorias: categoriesList, pagamento: pagamento, df: df])
		}
	}

	def validator = { Pagamento payment ->
		
		String fieldName = params.fieldName
		def specialFields = ["valor","parcels"]
		
		if(fieldName.indexOf(".") != -1){
			fieldName = fieldName.substring(0, fieldName.indexOf("."))	
		} else if(specialFields.contains(fieldName) || fieldName.equals("FORM")){
				
			if(!params.valor || geralService.containsLetters(params.valor)){
				payment.valor = 0
				payment.clearErrors()
				payment.validate()
			 }
			
			if(!params.parcels || geralService.containsLetters(params.parcels)){
				payment.parcels = 0
				payment.clearErrors()
				payment.validate()
			}
		}

		if(fieldName.equals("FORM") && payment.hasErrors()){
			render "${message(code: 'default.form.error.message', default: 'error')}"
		} else if(fieldName && payment.errors.hasFieldErrors(fieldName)){
			render g.renderErrors(bean: payment,field: fieldName)
		}else {
			render ""
		}
	}
}
