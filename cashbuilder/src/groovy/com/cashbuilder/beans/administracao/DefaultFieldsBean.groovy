package com.cashbuilder.beans.administracao

class DefaultFieldsBean {

	List mapCategorias
	
	public void init(){
		
		List categoria1 = ["Salário","Extras","Aluguel","Férias","Outros"]
		def map1 = ["Receita":categoria1]
		
		List categoria2 = ["Poupança","Ações","Renda Fixa","Previdência Privada","Outros"]
		def map2 = ["Investimentos":categoria2]
		
		List categoria3 = ["Escola","Faculdade","Cursos"]
		def map3 = ["Educacao":categoria3]
		
		List categoria4 = ["Plano de Saúde","Remédios","Consultas"]
		def map4 = ["Saude":categoria4]
		
		List categoria5 = ["Supermercado","Feira","Açougue"]
		def map5 = ["Alimentacao":categoria5]
		
		List categoria6 = ["IPTU","IPVA","Taxas Bancárias"]
		def map6 = ["Impostos e Tarifas":categoria6]
		
		List categoria7 = ["Combustível","Vale Transporte","Passagens","Seguro","Manutenção","Prestações","Estacionamento"]
		def map7 = ["Transporte":categoria7]
		
		List categoria8 = ["Aluguel","Condomínio","Financiamento","Seguro","Mensalista","Luz","Agua","Gás","Manutenção","Telefone","Internet","TV Paga"]
		def map8 = ["Habitação":categoria8]
		
		List categoria9 = ["Cabelereiro","Esteticista","Academia","Vestuário","Presentes","Outros"]
		def map9 = ["Gastos Pessoais":categoria9]
		
		List categoria10 = ["Cinema/Teatro","Viagens","Restaurantes","Jogos"]
		def map10 = ["Lazer":categoria10]
		
		mapCategorias = new ArrayList()
		List maps = [map1,map2,map3,map4,map5,map6,map7,map8,map9,map10]
		
		maps.each { map ->
			mapCategorias.add map
		}
	}
}
