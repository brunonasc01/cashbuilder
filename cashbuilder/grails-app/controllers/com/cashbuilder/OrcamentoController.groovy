package com.cashbuilder

import java.util.Calendar;

class OrcamentoController {

	def orcamentoService
	
	def scaffold = true
	
    def index = {

		def user = session.user.attach()
		def orcamento = Orcamento.findByAnoAndUser(Calendar.getInstance().get(Calendar.YEAR),user)
		def categoriasDeb = Categoria.findAllByReceitaAndUser(false,user)
		def categoriasCred = Categoria.findAllByReceitaAndUser(true,user)

		[orcamento : orcamento, saidas : categoriasDeb, entradas : categoriasCred, service : orcamentoService]
	}
}
