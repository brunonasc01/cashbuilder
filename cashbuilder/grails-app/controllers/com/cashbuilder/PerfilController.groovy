package com.cashbuilder

class PerfilController {

	def usuarioService
	
    def index = {
	
		[ocultaMenu: true]	
	}
	
	def save = {
		
		def user = session.user.attach()
		def perfil = Perfil.findByUsuario(user)
		
		if(perfil){
			perfil.properties = params

			def listaCategorias = new ArrayList()
			
			File fileGeral = grailsAttributes.getApplicationContext().getResource("res/categoriaGeral.csv").getFile()
			listaCategorias.add fileGeral

			if(params.animalEstimacao){
				File file = grailsAttributes.getApplicationContext().getResource("res/categoriaMascote.csv").getFile()
				listaCategorias.add file
			}

			if(params.automovel){
				File file = grailsAttributes.getApplicationContext().getResource("res/categoriaVeiculo.csv").getFile()
				listaCategorias.add file
			}

			if(params.filho){
				File file = grailsAttributes.getApplicationContext().getResource("res/categoriaFilho.csv").getFile()
				listaCategorias.add file
			}

			usuarioService.geraPerfil(user,listaCategorias)
			
			redirect(controller:'home')
		}
	}
}
