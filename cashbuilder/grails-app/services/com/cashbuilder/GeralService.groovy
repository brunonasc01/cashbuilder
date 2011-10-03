package com.cashbuilder

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;

import com.cashbuilder.beans.ListaCategoriasBean;

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

		return found
	}
}
