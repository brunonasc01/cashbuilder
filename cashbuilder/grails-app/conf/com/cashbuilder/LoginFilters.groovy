package com.cashbuilder

class LoginFilters {

    def filters = {
        all(controller:'pagamento|home|fluxocaixa|orcamento|meta|relatorio|administracao', action:'*') {
            before = {
				if (!session.user) {
					redirect(controller: 'login')
					return false
				}
            }
            after = {
                
            }
            afterView = {
                
            }
        }
		
		verificaLogin(controller:'*', action:'*') {
			before = {
				
			}
			after = {
				
			}
			afterView = {
				
			}
		}
    }
    
}
