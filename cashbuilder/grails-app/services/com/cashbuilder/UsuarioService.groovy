package com.cashbuilder


import com.cashbuilder.beans.administracao.DefaultFieldsBean;
import com.cashbuilder.utils.DateUtils;


class UsuarioService {

    static transactional = true

    def serviceMethod() {

    }
	
	void initUser(Usuario user){
		
		int ano = DateUtils.getCurrentYear()
		Orcamento orcm = new Orcamento(ano: ano,user:user)
		orcm.save(flush: true) 
		
		for(int mes in 0..11){
			new OrcmMes(mes:mes,orcamento:orcm).save(flush:true)
		}
		
		DefaultFieldsBean bean = new DefaultFieldsBean()
		bean.init()

		bean.mapCategorias.each { map ->
			
			map.each { categ ->

				boolean receita = categ.key.equals("Receita")
				
				Categoria categoriaBean = new Categoria( nome:categ.key, user:user, receita:receita ).save(flush: true)
				List lsSubcat = categ.value
	
				lsSubcat.each { subcat ->
					new Subcategoria(nome: subcat,categoria:categoriaBean).save(flush: true)
				}
			}
		}
	}
	
	boolean isValidEmail(Usuario user){
		
		return Usuario.findByEmail(user.email)
	}
}
