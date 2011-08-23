package com.cashbuilder

class CategoriaController {

	def categoriaSelected = {
		
		def id = params.id
		def categoria = Categoria.findById(params.id)
		render g.select(optionKey: 'id', from: categoria.subcategorias, id: "comboSubcategorias", name: "subcategoria.id")
	}
	
	def categoriaMultipleSelected = {
		
		def id = params.id
		def categoria = Categoria.findById(params.id)
		render g.select(optionKey: 'id', from: categoria.subcategorias, id: "comboSubcategorias", name: "subcategorias[0].id")
	}
}
