package com.cashbuilder

import com.cashbuilder.utils.Constants;

class PagamentoController {

	def geralService
	
	def delete = {
		def pagamento = Pagamento.get(params.id)

		if (pagamento) {
			try {
				pagamento.delete(flush: true)
				flash.message = "Registro excluido com sucesso"
				redirect(controller:"fluxoCaixa", action: "index")

			} catch (org.springframework.dao.DataIntegrityViolationException e) {

			}
		}
		else {
			flash.message = "Erro ao apagar o registro, tente novamente"
			redirect(controller:"fluxoCaixa", action: "index")
		}
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
		}
		else {
			
			def categoriesList = geralService.getCategoriesList(pagamento.user)
			def df = geralService.getFormatadorNumerico()
			
			render(view: "edit", model: [listCategorias: categoriesList, pagamento: pagamento, df: df])
		}
	}
	
	def update = {

		def pagamento = Pagamento.get(params.id)

		if (pagamento) {
			
			pagamento.properties = params
			pagamento.natureza = (pagamento.categoria?.receita)? Constants.CREDITO : Constants.DEBITO;

			if (!pagamento.hasErrors()) {
				flash.message = "Registro atualizado com sucesso."
				redirect(controller:"fluxoCaixa", action: "index")
			}
			else {
				render(view: "edit", model: [pagamento: pagamento])
			}
		}
		else {
			flash.message = "Nao foi possivel atualizar o registro, tente novamente."
			redirect(action: "edit")
		}
	}
	
	def save = {

		def pagamento = new Pagamento(params)
		pagamento.natureza = (pagamento.categoria?.receita)? Constants.CREDITO : Constants.DEBITO;
		
		def user = session.user.attach()
		pagamento.user = user
		
		if(!pagamento.hasErrors()){
			pagamento.save(flush:true)

			redirect(controller:"fluxoCaixa", action: "index")
		}
		else{
			render(view: "novo", model: [pagamento: pagamento])
		}
	}
	
	def cancel = {
		redirect(controller:"fluxoCaixa", action: "index")
	}
	
	def validator = { Pagamento payment ->
		
		String fieldName = params.fieldName
		
		if(fieldName.indexOf(".") != -1){
			fieldName = fieldName.substring(0, fieldName.indexOf("."))	
		}

		if(fieldName.equals("FORM") && payment.hasErrors()){
			render g.renderErrors(bean: payment)
		} else if(fieldName && payment.errors.hasFieldErrors(fieldName)){
			render g.renderErrors(bean: payment,field: fieldName)
		}else {
			render ""
		}
	}
}
