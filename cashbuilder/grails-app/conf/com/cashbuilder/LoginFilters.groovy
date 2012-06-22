package com.cashbuilder

class LoginFilters {

    def filters = {
        all(controller:'transaction|budget|cashflow|goal|home|manager|category', action:'*') {
            before = {
				if (!session.user) {
					redirect(uri: "/")
					return false
				}
            }
            after = {
                
            }
            afterView = {
                
            }
        }
		
		verificaLogin(controller:'user', action:'edit|edit_mail|edit_password') {
			before = {
				if (!session.user) {
					redirect(uri: "/")
					return false
				}
			}
			after = {
				
			}
			afterView = {
				
			}
		}
    }
    
}
