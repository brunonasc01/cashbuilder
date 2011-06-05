package com.cashbuilder

class LoginFilters {

    def filters = {
        all(controller:'home|relatorio', action:'*') {
            before = {
				if (!session.user) {
					redirect(controller: 'administracao', action: 'login')
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
