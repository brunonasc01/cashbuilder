package com.cashbuilder.cmd

import java.util.Date;

import org.codehaus.groovy.grails.validation.Validateable;

@Validateable
class PerfilCommand {

	String nomeCompleto
	String cidade
	String estado
	String pais

	static constraints = {
		nomeCompleto(blank: false, maxLength:40)
		cidade(blank: false)
		estado(blank: false)
		pais(blank: false)
	}
}
