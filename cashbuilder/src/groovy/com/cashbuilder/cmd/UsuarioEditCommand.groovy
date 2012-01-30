package com.cashbuilder.cmd

import java.util.Date;

import org.apache.commons.lang.Validate;

class UsuarioEditCommand {
	
	String nome

	PerfilCommand perfil

	public UsuarioEditCommand(){
		perfil = new PerfilCommand()
	}
	
	static constraints = {
		nome(size:3..20, blank: false)
	}
}
