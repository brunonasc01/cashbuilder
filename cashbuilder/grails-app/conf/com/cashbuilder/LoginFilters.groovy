package com.cashbuilder

class LoginFilters {

    def filters = {
        all(controller:'administracao|home|relatorio', action:'*') {
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
