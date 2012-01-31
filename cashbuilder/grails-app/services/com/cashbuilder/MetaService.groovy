package com.cashbuilder

import java.text.DecimalFormat;

import com.cashbuilder.beans.meta.MetaBean;
import com.cashbuilder.utils.Constants;

class MetaService {

    static transactional = true

    def serviceMethod() {

    }
	
	Meta saveMeta(Usuario user, String properties){
		if(user){
			def meta = new Meta(properties)
			meta.user = user;
		
			if(meta.save()){
				return meta
			} else {
				throw new RuntimeException(message: "Meta invalida ou vazia")
			}
		}
		throw new RuntimeException(message: "Usuario Invalido")
	}
	
	List getMetas(Usuario user){
		
		def result = []
		def metas = Meta.findAllByUser(user)
		
		metas.each { meta ->
			
			MetaBean bean = new MetaBean()

			double	total = Pagamento.createCriteria().get {
				and {
					eq('user', user)
					'in'('subcategoria', meta.subcategorias)
					between('data', meta.dataInicio, meta.dataFim)
				}
				projections { sum "valor" }
			}
				
			total = (total)? total : 0

			Date date = new Date()
			
			if(date.after(meta.dataFim)){
				if(total >= meta.valorAlmejado){
					bean.status = Constants.META_ATINGIDA
				}else{
					bean.status = Constants.META_PERDIDA
				}
			}else{
				if(total >= meta.valorAlmejado){
					bean.status = Constants.META_ATINGIDA
				}else{
					bean.status = Constants.META_CORRENTE
				}
			}

			switch(bean.status){
				
				case Constants.META_CORRENTE:
				bean.porcentagem = (total/meta.valorAlmejado)*100
				break
				
				case Constants.META_ATINGIDA:
				bean.porcentagem = 100
				break
				
				case Constants.META_PERDIDA:
				bean.porcentagem = 0
				break
			}
									
			bean.nome = meta.nome
			bean.valorFinal = meta.valorAlmejado
			bean.valorAcumulado = total

			result += bean
		}
		
		result
	}
	
	List getGoalStats(Usuario user){
		
		def result = ["0","0","0"]
		def metas = Meta.findAllByUser(user)
		
		int goalsTotal = metas.size		
		int finishedGoals = 0;
		int workingGoals = 0;
		int lostGoals = 0;

		metas.each { meta ->

			MetaBean bean = new MetaBean()

			double	total = Pagamento.createCriteria().get {
				and {
					eq('user', user)
					'in'('subcategoria', meta.subcategorias)
					between('data', meta.dataInicio, meta.dataFim)
				}
				projections { sum "valor" }
			}
				
			total = (total)? total : 0

			Date date = new Date()

			if(date.after(meta.dataFim)){
				if(total >= meta.valorAlmejado){
					finishedGoals += 1
				}else{
					lostGoals += 1
				}
			}else{
				if(total >= meta.valorAlmejado){
					finishedGoals += 1
				}else{
					workingGoals += 1
				}
			}
		}

		if(goalsTotal > 0){
			DecimalFormat df = new DecimalFormat()
			df.setMaximumFractionDigits(2);
			
			result[0] = "${workingGoals} (${df.format((workingGoals/goalsTotal)*100)}%)"
			result[1] = "${finishedGoals} (${df.format((finishedGoals/goalsTotal)*100)}%)"
			result[2] = "${lostGoals} (${df.format((lostGoals/goalsTotal)*100)}%)"
		}
		
		result
	}
}
