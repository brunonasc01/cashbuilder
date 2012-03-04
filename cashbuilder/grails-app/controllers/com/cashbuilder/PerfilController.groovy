package com.cashbuilder

class PerfilController {
		
	def geralService
	
	static allowedMethods = [save: "POST"]
	
    def index = {

		def namesList = ["Animal de Estimacao","Carro ou Moto","Filho(s)"]
		
		[ocultaMenu: true, expenses : namesList]	
	}
	
	def save = {
		def user = session.user.attach()
		params."usuario.id" = user.id

		def perfil = new Perfil(usuario:user)
		perfil.properties = params
		
		if(!perfil.hasErrors()){
			perfil.save(flush:true)
			
			def listaCategorias = []
			
			File fileGeral = grailsAttributes.getApplicationContext().getResource("res/categoriaGeral.csv").getFile()
			listaCategorias += fileGeral

			def expensesFileMap = ["Animal de Estimacao":"res/categoriaMascote.csv",
									"Carro ou Moto":"res/categoriaVeiculo.csv",
									"Filho(s)":"res/categoriaFilho.csv"]
			
			perfil.expenses.each { expense ->
				if(expense.enabled){
					String resourcePath = expensesFileMap.get(expense.name)
					File file = grailsAttributes.getApplicationContext().getResource(resourcePath).getFile()
					listaCategorias += file
				}
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
