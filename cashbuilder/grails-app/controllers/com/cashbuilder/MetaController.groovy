package com.cashbuilder

import com.cashbuilder.beans.BoxRegRapidoBean;
import com.cashbuilder.beans.meta.MetaBean;

class MetaController {

	def scaffold = true
	
    def index = {
		
		def user = session.user.attach()

		//box registro rapido
		def allCategorias = Categoria.findAllByUser(user)
		List allSubcategoria = new ArrayList()

		allCategorias.each { categoria ->
			def subcategorias = Subcategoria.findAllByCategoria(categoria)
			allSubcategoria.addAll(subcategorias)
		}

		BoxRegRapidoBean registroRapido = new BoxRegRapidoBean(categorias:allCategorias, subcategorias:allSubcategoria)
		
		// Lista de Metas
		List listMetas = new ArrayList<MetaBean>()
		
		def metas = Meta.findAllByUser(user)
		
		metas.each { meta ->
			
			MetaBean bean = new MetaBean()
			double total = 0.0
			
			meta.subcategorias.each{ subcategoria ->

				def pagamentos = Pagamento.createCriteria().list {
					and {
						eq('subcategoria', subcategoria)
						between('data', meta.dataInicio, meta.dataFim)
					}
				}

				if(pagamentos){
					pagamentos.each {
						total += it.valor
					}
				}
			}
			
			bean.nome = meta.nome
			bean.descricao = meta.descricao
			bean.valorAcumulado = total
			bean.porcentagem = (total/meta.valorAlmejado)*100 
			
			listMetas.add(bean)
		}
			
		

		[goal : true, listCategorias: registroRapido, metas: listMetas ]
	}


	def save = {

		def meta = new Meta(params)
		
		def user = session.user.attach()
		meta.user = user
		
		if(!meta.hasErrors()){
			meta.save(flush:true)

			redirect(controller:"meta", action: "index")
		}
		else{
			render(view: "index", model: [metaInstance: meta])
		}
	}
	
}
