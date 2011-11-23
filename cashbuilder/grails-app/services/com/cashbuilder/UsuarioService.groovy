package com.cashbuilder

import grails.validation.ValidationException;

import com.cashbuilder.cmd.UsuarioCommand;
import com.cashbuilder.utils.DateUtils;


class UsuarioService {

    static transactional = true

    def serviceMethod() {

    }
	
	Usuario verifyLogin(Map params){
		String password = Encoder.encode(params.password)
		return Usuario.findByEmailAndPassword(params.email,password)
	}
	
	/**
	 * Verifica se o email informado e valido
	 * @param usuario usuario com email a ser verificado
	 * @return true se o email existir no banco de dado
	 */
	boolean isEmailAvailable(String email){

		return (Usuario.findByEmail(email) == null)
	}
	
	Usuario saveUser(def userCommand){

		if(userCommand){			
			if(isEmailAvailable(userCommand.email)){				
				if(userCommand.validate()){
					def newUser = new Usuario(userCommand.properties)
					newUser.password = Encoder.encode(newUser.password)
					
					if(newUser.save()){				
						return newUser
					} else{
						throw new RuntimeException("Nao foi possivel gravar o usuario")
					}
				} else {
					throw new ValidationException("Usuario invalido",userCommand.errors)
				}
			} else {
				throw new RuntimeException("Endereco de email ja cadastrado")
			}
		}
		throw new RuntimeException("Usuario Invalido")
	}
}
