package com.cashbuilder

class GeralService {

    static transactional = true

    def serviceMethod() {

    }
	
	double getTotalPagamentos(Usuario usuario, Date dataInicial, Date dataFinal, String natureza){
		
		double total = Pagamento.createCriteria().get {
			and {
				eq('user', usuario)
				eq('natureza', natureza)
				between('data', dataInicial, dataFinal)
			}
			projections { sum "valor" }
		}

		(total)? total : 0
	}
	
}
