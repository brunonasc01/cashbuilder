package com.cashbuilder

import java.util.Date;

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
		
		[orcmMes : mes]
	}
	
	def save_itens = {
		
		def orcmMes = OrcmMes.get(params.id)
		
		orcmMes.properties = params
		
		
		render(view: "adm_orcm", model: [orcmMes: orcmMes])
	}
}
