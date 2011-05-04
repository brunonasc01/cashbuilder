package com.cashbuilder

class Usuario {

   String userId
	String password
	String email
	Date dateCreated
	
    static constraints = {
		
		userId(size:3..20,unique:true,blank:false)
		password(size: 6..8,blank:false, 
					Validator: { passwd, user ->
						return passwd != user.userId
					}
				)
		
		email(email: true, nullable: true)
    }
	
	static hasMany = [orcamentos: Orcamento, categorias: Categoria, pagamentos: Pagamento]
	
	String toString(){
		"${userId}"
	}
}
