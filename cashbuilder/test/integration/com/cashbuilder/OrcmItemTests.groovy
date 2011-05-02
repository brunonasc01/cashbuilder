package com.cashbuilder

import grails.test.*

class OrcmItemTests extends GroovyTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testSomething() {

    }
	
	void testBusca(){
	
		def baseMes = OrcmMes.findByMesIlike("Janeiro")
		def baseCategoria = Categoria.findByNomeIlike("Gastos Pessoais")

		def itens = baseMes.itens;
		def itensList = itens
		
		double total = 0.0
		
		if(itensList){
			for(OrcmItem item : itensList){
				total += item.valorPrevisto
				println "total ${total} categoria ${item.subcategoria}"
			}
		}
	}
}
