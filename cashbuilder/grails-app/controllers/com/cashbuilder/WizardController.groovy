package com.cashbuilder

class WizardController {

    def index = {
		redirect(action: "orcm")	
	}
	
	def orcmFlow = {
		
		//1
		cadastraOrcamento{
			on("next"){
				//captura o orcamento e meses
			}			
		}.to("cadastraCategorias")
		on("cancel").to("finish")
		
		//2
		cadastraCategorias{
			on("next"){
				//captura as categorias e subcategorias
			}
		}.to("defineOrcmCategorias")
		on("previous").to("cadastraOrcamento")
		
		//3
		defineOrcmCategorias{
			on("next"){
				//pega todos os orcamentos
			}.to("revisaOrcamento")
		}
		on("previous").to("cadastraCategorias")
		
		//4
		revisaOrcamento{
			on("next"){
			//tela de confirmacao
		}.to("orcmConcluido")	
		on("previous").to("defineOrcmCategorias")
		}
		
		//5
		orcmConcluido{
			//exibe avisos
			on("finished").to("finish")
		}
		
		//6
		finish{
			redirect(controller:"home")
		}
	}	
}
