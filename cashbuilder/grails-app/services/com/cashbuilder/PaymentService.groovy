package com.cashbuilder

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
}