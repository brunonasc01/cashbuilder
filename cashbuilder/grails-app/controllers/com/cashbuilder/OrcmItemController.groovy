package com.cashbuilder

import com.cashbuilder.utils.DateUtils;

class OrcmItemController {

	def update = {
		
		try {
			OrcmItem orcmItem = OrcmItem.get(params.id)

			if(orcmItem){
				orcmItem.properties = params.properties
				flash.message = "Orcamento atualizado com sucesso"
			}
		} catch (RuntimeException re){
			flash.message = re.message
		}
		redirect(controller:"orcamento", action: "index", params: [mesId: params.mesId])
	}
}
