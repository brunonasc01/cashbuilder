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
	
	Usuario updateUser(Map params){
		def userInstance = Usuario.get(params.id)
		
		if(userInstance){
			userInstance.properties = params
			
			if(userInstance.hasErrors()){
				throw new ValidationException("Dados invalidos",userInstance.errors)
			}
			else{ 
				userInstance.save(flush: true)
				return userInstance
			}
		}
		throw new RuntimeException("Usuario Invalido")
	}
	
	Usuario updateMail(def userMailCommand){
		
		if(userMailCommand.validate()){
			def userInstance = Usuario.get(userMailCommand.id)
			
			if(userInstance){
				
				if(userInstance.email != userMailCommand.email){
					throw new RuntimeException("O e-mail atual esta incorreto")
				}
				
				userInstance.email = userMailCommand.emailNovo
				userInstance.save(flush: true)
				return userInstance
			}
		}

		throw new RuntimeException("Dados Invalidos")
	}
	
	Usuario updatePassword(def userPasswordCommand){
		
		if(userPasswordCommand.validate()){
			def userInstance = Usuario.get(userPasswordCommand.id)
			
			if(userInstance){
				String oldPassword = Encoder.encode(userPasswordCommand.password)
												
				if(!userInstance.password.equals(oldPassword)){
					throw new RuntimeException("A senha atual esta incorreta")
				}
				
				userInstance.password = Encoder.encode(userPasswordCommand.passwordNovo)
				userInstance.save(flush: true)
				return userInstance
			}
		}

		throw new RuntimeException("Dados Invalidos")
	}
}
