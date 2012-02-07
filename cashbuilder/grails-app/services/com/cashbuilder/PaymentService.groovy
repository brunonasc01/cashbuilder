package com.cashbuilder

import java.util.Map;

import grails.validation.ValidationException;

import com.cashbuilder.utils.Constants;
import com.cashbuilder.utils.DateUtils;

class PaymentService {

    static transactional = true

    def serviceMethod() {

    }
	
	Pagamento savePayment(Usuario user, Map params){
		if(user){
			int parcels = Integer.valueOf(params.parcels)?: 1

			if(parcels <= 1){
				def pagamento = new Pagamento(params.properties)
				pagamento.natureza = (pagamento.categoria?.receita)? Constants.CREDITO : Constants.DEBITO
				pagamento.user = user

				if(pagamento.save()){
					return pagamento
				} else {
					throw new RuntimeException(message: "Pagamento invalido ou vazio")
				}
			} else {
				savePaymentParcels(user,params)
				return null
			}
			
		}
		throw new RuntimeException(message: "Usuario Invalido")
	}
	
	void savePaymentParcels(Usuario user, Map params){
		
		Calendar paymentDate = Calendar.getInstance()
		def basePayment = new Pagamento(params.properties)
		basePayment.natureza = (basePayment.categoria?.receita)? Constants.CREDITO : Constants.DEBITO
		basePayment.user = user
						
		paymentDate.setTime(basePayment.data)
		int parcels = basePayment.parcels
		basePayment.valor = basePayment.valor/parcels
		basePayment.parcels = 1

		int paymentMonth = paymentDate.get(Calendar.MONTH)
		int paymentYear = paymentDate.get(Calendar.YEAR)

		(0..parcels-1).each {
			paymentDate.set(Calendar.MONTH,paymentMonth)
			paymentDate.set(Calendar.YEAR,paymentYear)
			
			def paymentParcel = new Pagamento(basePayment.properties)
			paymentParcel.data = new Date(paymentDate.getTimeInMillis())
			paymentParcel.save(flush:true)
			
			if(paymentMonth == Calendar.DECEMBER){
				paymentMonth = 0
				paymentYear += 1
			} else {
				paymentMonth += 1
			}
		}
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