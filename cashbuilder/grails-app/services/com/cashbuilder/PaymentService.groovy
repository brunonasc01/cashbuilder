package com.cashbuilder

import grails.validation.ValidationException;

import com.cashbuilder.utils.Constants;

class PaymentService {

    static transactional = true

    def serviceMethod() {

    }
	
	Pagamento savePayment(Usuario user, String properties){
		if(user){
			def pagamento = new Pagamento(properties)
			pagamento.natureza = (pagamento.categoria?.receita)? Constants.CREDITO : Constants.DEBITO;
			pagamento.user = user

			if(pagamento.save()){
				return pagamento
			} else {
				throw new RuntimeException(message: "Pagamento invalido ou vazio")
			}
		}
		throw new RuntimeException(message: "Usuario Invalido")
	}
	
	boolean deletePayment(String paymentId){
		def pagamento = Pagamento.get(paymentId)

		if(pagamento) {
			pagamento.delete()

			if(Pagamento.exists(pagamento.id)){
				throw new RuntimeException(message: "Erro ao apagar o registro")
			} else {
				return true
			}
		}
		throw new RuntimeException(message: "Pagamento invalido ou inexistente")
	}
	
	Pagamento updatePayment(String paymentId, String properties){
		def pagamento = Pagamento.get(paymentId)
		
		if(pagamento) {
			pagamento.properties = properties
			pagamento.natureza = (pagamento.categoria.receita)? Constants.CREDITO : Constants.DEBITO;
			
			if(pagamento.validate()){
				return pagamento
			} else {
				throw new ValidationException("Pagamento invalido",pagamento.errors)
			}
		}
		throw new RuntimeException(message: "Nao foi possivel atualizar o registro, tente novamente")
	}
}