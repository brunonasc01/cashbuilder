package com.cashbuilder

class PagamentoController {

	def delete = {
		def pagamento = Pagamento.get(params.id)

		if (pagamento) {
			try {
				pagamento.delete(flush: true)
				flash.message = "Registro excluido com sucesso"
				redirect(controller:"fluxoCaixa", action: "index")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {

			}
		}
		else {
			flash.message = "Erro ao apagar o registro, tente novamente"
			redirect(controller:"fluxoCaixa", action: "index")
		}
	}
	
	def edit = {
		def pagamento = Pagamento.get(params.id)
		
		if (!pagamento) {
			flash.message = "Nao foi possivel editar o pagamento, tente novamente"
			redirect(controller:"fluxoCaixa", action: "index")
		}
		else {
			return [pagamento: pagamento]
		}
	}
}
