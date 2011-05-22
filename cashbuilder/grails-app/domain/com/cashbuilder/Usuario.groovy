package com.cashbuilder

class Usuario {

	String email
	String nome
	String password
	Date dateCreated
	
    static constraints = {
		
		email(email: true, unique:true,blank:false)
		nome(size:3..20,blank:false)
		password(size: 6..8,blank:false, 
					Validator: { passwd, user ->
						return passwd != user.userId
					}
				)
    }
	
	static hasMany = [orcamentos: Orcamento, categorias: Categoria, pagamentos: Pagamento]
	
	String toString(){
		"${userId}"
	}
}
