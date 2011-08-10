package com.cashbuilder

import com.cashbuilder.utils.DateUtils;


class UsuarioService {

    static transactional = true

    def serviceMethod() {

    }
	
	void initUser(Usuario user,File file){
		
		int ano = DateUtils.getCurrentYear()
		Orcamento orcm = new Orcamento(ano: ano,user:user)
		orcm.save(flush: true)

		file.eachLine{ linha ->
			
			String[] linhaBase = linha.split(":")
			
			if(linhaBase.length > 0 && !linhaBase[0].contains("#")){
				
				String categoria = linhaBase[0]
				boolean receita = ("Receitas").equals(categoria)

				Categoria categoriaBean = new Categoria( nome:categoria, user:user, receita:receita ).save(flush: true)
				
				String[] subcategorias = linhaBase[1].split(";")
				
				subcategorias.each { nome ->
					new Subcategoria(nome: nome,categoria:categoriaBean).save(flush: true)
				}
			}
		}

		def allCategorias = Categoria.findAllByUser(user)
		
		for(int mes in 0..11){
			OrcmMes orcmMes = new OrcmMes(mes:mes,orcamento:orcm).save(flush:true)
			
			for(Categoria categoria in allCategorias){
				
				def subcategorias = Subcategoria.findAllByCategoria(categoria)
				
				for(Subcategoria subcategoria in subcategorias){
					new OrcmItem(categoria:categoria,subcategoria:subcategoria,mes:orcmMes).save(flush:true)
				}
			}
		}
	}
	
	boolean isValidEmail(Usuario user){
		
		return Usuario.findByEmail(user.email)
	}
}
