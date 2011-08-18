package com.cashbuilder

import com.cashbuilder.beans.ListaCategoriasBean;
import com.cashbuilder.utils.Constants;

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
		def categorias = Categoria.findAllByUser(user)
		def subcategorias = Subcategoria.createCriteria().list{
			'in'('categoria', categorias)
		}

		ListaCategoriasBean registroRapido = new ListaCategoriasBean(categorias:categorias, subcategorias:subcategorias)
		
		[listCategorias: registroRapido]
	}
	
	def ajaxNovo = {
		
		def user = session.user.attach()
		
		//box registro rapido
		def categorias = Categoria.findAllByUser(user)
		def subcategorias = Subcategoria.createCriteria().list{
			'in'('categoria', categorias)
		}

		ListaCategoriasBean registroRapido = new ListaCategoriasBean(categorias:categorias, subcategorias:subcategorias)
		
		render(view: "novo", model: [listCategorias: registroRapido])
	}
	
	def edit = {
		def pagamento = Pagamento.get(params.id)
		
		if (!pagamento) {
			flash.message = "Nao foi possivel editar o pagamento, tente novamente"
			redirect(controller:"fluxoCaixa", action: "index")
		}
		else {
			
			//box registro rapido
			def categorias = Categoria.findAllByUser(pagamento.user)
			def subcategorias = Subcategoria.createCriteria().list{
				'in'('categoria', categorias)
			}
	
			ListaCategoriasBean registroRapido = new ListaCategoriasBean(categorias:categorias, subcategorias:subcategorias)
			
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
}
