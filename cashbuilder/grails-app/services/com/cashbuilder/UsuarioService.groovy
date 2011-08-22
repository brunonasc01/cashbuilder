package com.cashbuilder

import com.cashbuilder.utils.DateUtils;


class UsuarioService {

    static transactional = true

    def serviceMethod() {

    }

	/**
	 * Cria a estrutura inicial para utilizacao do sistema
	 * @param usuario usuario atual
	 * @param arquivos lista de categorias para construcao do orcamento
	 */
	void geraPerfil(Usuario usuario,def arquivos){
		
		int ano = DateUtils.getAnoAtual()
		Orcamento orcm = new Orcamento(ano: ano,user:usuario)
		orcm.save(flush: true)

		arquivos.each { arquivo ->
			arquivo.eachLine{ linha ->
				
				String[] linhaBase = linha.split(":")
				
				if(linhaBase.length > 0 && !linhaBase[0].contains("#")){
					
					String categoria = linhaBase[0]
					boolean receita = ("Receitas").equals(categoria)
	
					Categoria categoriaBean = new Categoria( nome:categoria, user:usuario, receita:receita ).save(flush: true)
					
					String[] subcategorias = linhaBase[1].split(";")
					
					subcategorias.each { nome ->
						new Subcategoria(nome: nome,categoria:categoriaBean).save(flush: true)
					}
				}
			}
		}

		def allCategorias = Categoria.findAllByUser(usuario)
		
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
	
	/**
	 * Verifica se o email informado e valido
	 * @param usuario usuario com email a ser verificado
	 * @return true se o email existir no banco de dado
	 */
	boolean isEmailJaCadastrado(Usuario usuario){
		
		return Usuario.findByEmail(usuario.email)
	}
}
