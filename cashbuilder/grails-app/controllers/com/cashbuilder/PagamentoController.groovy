package com.cashbuilder

import com.cashbuilder.beans.BoxRegRapidoBean;

class PagamentoController {

	def delete = {
		def pagamento = Pagamento.get(params.id)

		if (pagamento) {
			try {
				pagamento.delete(flush: true)
				flash.message = "Registro excluido com sucesso"
				redirect(controller:"fluxoCaixa", action: "index")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {

			}
		}
		else {
			flash.message = "Erro ao apagar o registro, tente novamente"
			redirect(controller:"fluxoCaixa", action: "index")
		}
	}
	
	def novo = {

		def user = session.user.attach()

		//box registro rapido
		def allCategorias = Categoria.findAllByUser(user)
		List allSubcategoria = new ArrayList()

		allCategorias.each { categoria ->
			def subcategorias = Subcategoria.findAllByCategoria(categoria)
			allSubcategoria.addAll(subcategorias)
		}

		BoxRegRapidoBean registroRapido = new BoxRegRapidoBean(categorias:allCategorias, subcategorias:allSubcategoria)
		
		[listCategorias: registroRapido]
	}
	
	def edit = {
		def pagamento = Pagamento.get(params.id)
		
		if (!pagamento) {
			flash.message = "Nao foi possivel editar o pagamento, tente novamente"
			redirect(controller:"fluxoCaixa", action: "index")
		}
		else {
			
			//box registro rapido
			def allCategorias = Categoria.findAllByUser(pagamento.user)
			List allSubcategoria = new ArrayList()
	
			allCategorias.each { categoria ->
				def subcategorias = Subcategoria.findAllByCategoria(categoria)
				allSubcategoria.addAll(subcategorias)
			}
	
			BoxRegRapidoBean registroRapido = new BoxRegRapidoBean(categorias:allCategorias, subcategorias:allSubcategoria)
			
			return [pagamento: pagamento, listCategorias: registroRapido]
		}
	}
	
	def update = {

		def pagamento = Pagamento.get(params.id)

		if (pagamento) {
			
			pagamento.properties = params

			if (!pagamento.hasErrors() && pagamento.save(flush: true)) {
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
}
