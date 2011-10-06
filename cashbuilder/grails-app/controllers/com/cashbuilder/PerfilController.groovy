package com.cashbuilder

class PerfilController {
		
	def geralService
	
    def index = {
	
		[ocultaMenu: true]	
	}
	
	def save = {

		def perfil = new Perfil(params)
		
		def user = session.user.attach()
		perfil.usuario = user
		
		if(!perfil.hasErrors()){
			perfil.save(flush:true)
			
			def listaCategorias = []
			
			File fileGeral = grailsAttributes.getApplicationContext().getResource("res/categoriaGeral.csv").getFile()
			listaCategorias += fileGeral

			if(params.animalEstimacao){
				File file = grailsAttributes.getApplicationContext().getResource("res/categoriaMascote.csv").getFile()
				listaCategorias += file
			}

			if(params.automovel){
				File file = grailsAttributes.getApplicationContext().getResource("res/categoriaVeiculo.csv").getFile()
				listaCategorias += file
			}

			if(params.filho){
				File file = grailsAttributes.getApplicationContext().getResource("res/categoriaFilho.csv").getFile()
				listaCategorias += file
			}

			geralService.makeOrcmProfile(user,listaCategorias)
			
			redirect(controller:'home')
		} else{
			render(view: "index", model: [profileInstance: perfil])
		}
	}
	
	def validator = { Perfil profile ->
		
		def fieldName = params.fieldName

		if(fieldName.equals("FORM") && profile.hasErrors()){
			render "${message(code: 'default.form.error.message', default: 'error')}"
		} else if(fieldName && profile.errors.hasFieldErrors(fieldName)){
			render g.renderErrors(bean: profile,field: fieldName)
		}else {
			render ""
		}
	}
}
