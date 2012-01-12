package com.cashbuilder

class Usuario {

	String email
	String nome
	String password
	Date dateCreated
	Perfil perfil
	
	static hasMany = [orcamentos: Orcamento, categorias: Categoria, pagamentos: Pagamento, metas: Meta]
	
    static constraints = {
		
		email(email: true, unique:true,blank:false)
		nome(size:3..20,blank:false)
		password(blank:false, 
					Validator: { passwd, user ->
						return passwd != user.email
					}
				)
		perfil(nullable:true)
    }

	String toString(){
		"${nome} : ${email}"
	}
	
	static mapping = {
		perfil lazy:false
	}
}
