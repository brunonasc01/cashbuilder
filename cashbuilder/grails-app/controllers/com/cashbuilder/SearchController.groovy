package com.cashbuilder

class SearchController {

	def search = {
		def query = params.q
		
		if(!query){
			return [:]
		}
		
		try{
			params.withHighlighter = {highlighter, index, sr ->
				
				if(!sr.highlights){
					sr.highlights = []
				}
				
				def matchFragment = highlighter.fragment("descricao")
				sr.highlights[index] = "..." +
					(matchFragment ?: "") + "..." 
			}
			
			params.suggestQuery = true
			def searchResult = Pagamento.search(query,params)
			return [searchResult : searchResult]
		} catch(e){
			return [searchError : true]
		}
	}
}
