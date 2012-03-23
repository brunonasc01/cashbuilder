package com.cashbuilder

class CategoriaController {

	def categoriaSelected = {
		
		def id = params.id
		
		if(id){
			def categoria = Categoria.findById(params.id)
			render g.select(optionKey: 'id', from: categoria.subcategorias, id: "comboSubcategorias", name: "subcategoria.id")
		}
	}
	
	def categoriaMultipleSelected = {
		
		def id = params.id
		
		if(id){
			def categoria = Categoria.findById(params.id)
			render g.select(optionKey: 'id', from: categoria.subcategorias, id: "comboSubcategorias", name: "subcategorias[0].id")
		}
	}
	
	def new_category = {
		
		Categoria categoria = new Categoria(custom: true)
		categoria.subcategorias = []
		categoria.subcategorias += new Subcategoria()
		
		[adm: true, categoria: categoria]
	}
	
	def add_subcategory = { Categoria categoria ->

		categoria.subcategorias += new Subcategoria(nome:"")
		render(view: "new_category",model:[categoria: categoria,adm: true])
	}
	
	def save_category = { Categoria categoria ->
		def usuario = session.user.attach()
		categoria.user = usuario
		
		if(categoria.save()){
			
			def orcamentos = Orcamento.findAllByUser(usuario)
			def c = OrcmMes.createCriteria()
			
			def orcamentoMeses = c.list{
				'in'('orcamento', orcamentos)
			}

			orcamentoMeses.each { orcamentoMes -> 
				def subcategorias = Subcategoria.findAllByCategoria(categoria)

				subcategorias.each{ subcategoria ->
					new OrcmItem(categoria:categoria,subcategoria:subcategoria,mes:orcamentoMes).save()
				}
			}
			
			flash.message = "Nova categoria gravada com sucesso"
			redirect(controller: "administracao", action: "index")
		} else {
			render(view: "new_category",model:[categoria: categoria, adm: true])
		}
	}
}
