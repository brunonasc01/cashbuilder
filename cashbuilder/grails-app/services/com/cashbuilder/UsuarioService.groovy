package com.cashbuilder

import com.cashbuilder.utils.DateUtils;
import com.cashbuilder.utils.DefaultFields;

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
		
		List categorias = DefaultFields.getCategories()
		
		for(String categoria : categorias){
			boolean credito = categoria.equals("Receita")
			new Categoria(nome:categoria,receita:credito,user:user).save(flush:true)
		}
	}
	
	boolean isValidEmail(Usuario user){
		
		return Usuario.findByEmail(user.email)
	}
}
