package com.cashbuilder

import java.util.Date;

import com.cashbuilder.beans.administracao.OrcmMesBean;
import com.cashbuilder.cmd.UsuarioRegistroCommand;
import com.cashbuilder.utils.DateUtils;

class AdministracaoController {

	def usuarioService
	
    def index = { }
	
	def login = {
		if(session.user){
			redirect(controller:'home')
		}
	}
	
	def valida_login = {
		
		session.user = Usuario.findByEmailAndPassword(params.email,params.password)
		
		if(session.user){
			redirect(controller:'home')
		}else{
			flash.message = "Usuário ou Senha inválidos"
			redirect(action:'login')
		}
	}
	
	def logoff = {

		session.user = null
		redirect(action:'login')
	}
	
	def cadastro_usr = { }
	
	def save_reg = { UsuarioRegistroCommand urc ->

		if(usuarioService.isValidEmail( new Usuario(urc.properties)))
		{
			flash.message = "Endereço de e-mail ja cadastrado."
			render(view: "cadastro_usr", model: [usuarioInstance: urc])
			
		}else{
			if (!urc.hasErrors()) {
				def usuarioInstance = new Usuario(urc.properties)
				usuarioInstance.save(flush: true)
				
				usuarioService.initUser(usuarioInstance)
				
				flash.message = "${message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.id])}"
				redirect(action: "login", id: usuarioInstance.id)
			}
			else {
				render(view: "cadastro_usr", model: [usuarioInstance: urc])
			}
		}
	}
	
	def adm_orcm = {
		
		if(!params.mesId || !params.anoId){
			params.mesId = Calendar.getInstance().get(Calendar.MONTH)
			params.anoId = DateUtils.currentYear
		}
		
		int iMes = Integer.valueOf(params.mesId)
		int iAno = Integer.valueOf(params.anoId)
		
		def user = session.user.attach()
		def orcamento = Orcamento.findByAnoAndUser(iAno,user)
		def mes = OrcmMes.findByMesAndOrcamento(iMes,orcamento)
		
		List orcmItens = new ArrayList()
		
		def allCategorias = Categoria.findAllByUser(user)
		
		allCategorias.each { categoria ->
			
			OrcmMesBean bean = new OrcmMesBean()
			bean.categoria = categoria.nome
			bean.subcategorias = OrcmItem.findAllByCategoriaAndMes(categoria,mes)
			
			orcmItens.add bean
		}

		[orcmItens : orcmItens, orcmMes: mes]
	}
	
	def save_itens = {
						
		def user = session.user.attach()
		
		def orcmMes = OrcmMes.get(params.id)		
		orcmMes.properties = params
		
		List orcmItens = new ArrayList()
		
		def newOrcm = OrcmMes.get(params.id)
		def allCategorias = Categoria.findAllByUser(user)
		
		allCategorias.each { categoria ->
			
			OrcmMesBean bean = new OrcmMesBean()
			bean.categoria = categoria.nome
			bean.subcategorias = OrcmItem.findAllByCategoriaAndMes(categoria,newOrcm)
			
			orcmItens.add bean
		}

		def tipoSave = params?.tipoSave
		
		if(tipoSave.equals("ano")){
			flash.message = "Orcamento para o Ano Salvo com Sucesso."
		}else{
			flash.message = "Orcamento para o Mes Salvo com Sucesso."
		}
		
		redirect(action:'adm_orcm')
	}
}
