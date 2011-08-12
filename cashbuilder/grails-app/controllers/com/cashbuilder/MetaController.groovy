package com.cashbuilder

import com.cashbuilder.beans.BoxRegRapidoBean;
import com.cashbuilder.beans.meta.MetaBean;
import com.cashbuilder.utils.Constants;

class MetaController {

	def scaffold = true
	
    def index = {
		
		def user = session.user.attach()

		//box registro rapido
		def categorias = Categoria.findAllByUser(user)
		List allCategorias = new ArrayList()
		List allSubcategoria = new ArrayList()

		categorias.each { categoria ->
			allCategorias.add categoria
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
			
			Date date = new Date()
			
			if(date.after(meta.dataFim)){
				if(total >= meta.valorAlmejado){
					bean.status = Constants.META_ATINGIDA
				}else{
					bean.status = Constants.META_PERDIDA
				}
			}else{
				if(total >= meta.valorAlmejado){
					bean.status = Constants.META_ATINGIDA
				}else{
					bean.status = Constants.META_CORRENTE
					
				}
			}

			switch(bean.status){
				
				case Constants.META_CORRENTE:
				bean.porcentagem = (total/meta.valorAlmejado)*100
				break
				
				case Constants.META_ATINGIDA:
				bean.porcentagem = 100
				break
				
				case Constants.META_PERDIDA:
				bean.porcentagem = 0
				break
			}
									
			bean.nome = meta.nome
			bean.valorFinal = meta.valorAlmejado
			bean.valorAcumulado = total

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
