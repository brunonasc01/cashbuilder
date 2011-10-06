package com.cashbuilder

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;

import com.cashbuilder.beans.ListaCategoriasBean;
import com.cashbuilder.utils.DateUtils;

class GeralService {

    static transactional = true

    def serviceMethod() {

    }
	
	/**
	 * Reorna o total de pagamentos feitos num determinado intervalo de tempo
	 * @param usuario o usuario
	 * @param dataInicial a data inicial
	 * @param dataFinal a data final
	 * @param natureza a natureza do pagamento
	 * @return o total de pagamentos
	 */
	double getTotalPagamentos(Usuario usuario, Date dataInicial, Date dataFinal, String natureza){
		
		double total = Pagamento.createCriteria().get {
			and {
				eq('user', usuario)
				eq('natureza', natureza)
				between('data', dataInicial, dataFinal)
			}
			projections { sum "valor" }
		}

		(total)? total : 0
	}
	
	/**
	 * Obtem o formatador de numeros 
	 * @return o formatador numerico
	 */
	DecimalFormat getFormatadorNumerico(){
		NumberFormat cf = NumberFormat.getCurrencyInstance()
		DecimalFormat df = (DecimalFormat) cf
		DecimalFormatSymbols dfs = df.getDecimalFormatSymbols()
		dfs.setCurrencySymbol ""
		df.setDecimalFormatSymbols dfs
		
		df
	}
	
	/**
	 * Obtem as categorias e subcategorias do usuario atual
	 * @return objeto contendo todas as categorias
	 */
	ListaCategoriasBean getCategoriesList(Usuario user){
		
		def categorias = Categoria.findAllByUser(user)
		def subcategorias = Subcategoria.createCriteria().list{
			'in'('categoria', categorias)
		}
		
		new ListaCategoriasBean(categorias:categorias, subcategorias:subcategorias)
	}

	/**
	 * Verifica se uma string contem letras	
	 * @param text string a ser verificada
	 * @return true se existir alguma letra na string
	 */
	boolean containsLetters(String text){

		boolean found = false
		
		text.getChars().each { 
			if(it.isLetter()){
				found = true
			}
		}

		found
	}
	
	List getPagamentos(Usuario user, int month, int year){
		
		Date primeiroDia = DateUtils.getPrimeiroDia(month,year)
		Date ultimoDia = DateUtils.getUltimoDia(month,year)

		def pagamentos = Pagamento.createCriteria().list {
			and {
				eq('user', user)
				between('data', primeiroDia, ultimoDia)
			}
			order("data", "asc")
		}
		
		pagamentos
	}
	
	boolean saveManualBudget(Usuario user, String mesId, String saveType, String properties){
		if(user){
			def orcmMes = OrcmMes.get(mesId)
			
			if(orcmMes){
				
				if(saveType.equals("mes")){
					orcmMes.properties = properties
					
				} else if(saveType.equals("ano")){
					def orcamento = orcmMes.orcamento
					
					OrcmMes.findAllByOrcamento(orcamento).each {
						it.properties = properties
					}
				}
			} else {
				throw new RuntimeException(message: "Mes selecionado invalido ou vazio")
			}
		} else {
			throw new RuntimeException(message: "Usuario Invalido")
		}
	}
	
	
	/**
	 * Cria a estrutura inicial para utilizacao do sistema
	 * @param user usuario atual
	 * @param files lista de categorias para construcao do orcamento
	 */
	void makeOrcmProfile(Usuario user,def files){
	   	   
	   Orcamento budget = new Orcamento(ano: DateUtils.anoAtual,user:user)
	   
	   if(budget.save()){
		   files.each { file ->
			   file.eachLine{ linha ->
				   
				   String[] linhaBase = linha.split(":")
				   
				   if(linhaBase.length > 0 && !linhaBase[0].contains("#")){
					   
					   String categoria = linhaBase[0]
					   boolean receita = ("Receitas").equals(categoria)
	   
					   Categoria categoriaBean = new Categoria( nome:categoria, user:user, receita:receita )
					   
					   if(categoriaBean.save()){
						   String[] subcategorias = linhaBase[1].split(";")
						   
						   subcategorias.each { nome ->
							   new Subcategoria(nome: nome,categoria:categoriaBean).save()
						   }
					   } else {
					   		throw new RuntimeException(message:"Erro ao gravar a Categoria: ${categoriaBean.nome}")
					   }
				   }
			   }
		   }
	
		   def allCategorias = Categoria.findAllByUser(user)
	
		   (0..11).each { mes ->
			   OrcmMes orcmMes = new OrcmMes(mes:mes,orcamento:budget)
			   
			   if(orcmMes.save()){
				   allCategorias.each{ categoria ->
					   def subcategorias = Subcategoria.findAllByCategoria(categoria)
					   
					   subcategorias.each{ subcategoria ->
						   new OrcmItem(categoria:categoria,subcategoria:subcategoria,mes:orcmMes).save()
					   }
				   }
			   } else {
			   		throw new RuntimeException(message:"Erro ao gravar o Orcamento do Mes: ${mes}")
			   }
		   }
	   } else {
	   		throw new RuntimeException("Nao foi possivel criar o orcamento, tente novamente")
	   }
   }
}