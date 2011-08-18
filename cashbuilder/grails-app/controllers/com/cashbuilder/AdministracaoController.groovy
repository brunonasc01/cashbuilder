package com.cashbuilder

import java.text.DecimalFormat;
import java.util.Date;

import com.cashbuilder.beans.BoxSaldoBean;
import com.cashbuilder.beans.ListaCategoriasBean;
import com.cashbuilder.cmd.UsuarioRegistroCommand;
import com.cashbuilder.utils.Constants;
import com.cashbuilder.utils.DateUtils;

class AdministracaoController {

	def usuarioService
	def orcamentoService
	
    def index = {
	
		[adm : true]	
	}
	
	def login = {
		if(session.user){
			redirect(controller:'home')
		}
	}
	
	def valida_login = {
		
		session.user = Usuario.findByEmailAndPassword(params.email,params.password)
		
		if(session.user){
			def perfil = Perfil.findByUsuario(session.user)
			
			if(perfil.primeiroLogin){
				redirect(controller:'perfil')
			}else {
				redirect(controller:'home')
			}
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

		if(usuarioService.isEmailValido( new Usuario(urc.properties)))
		{
			flash.message = "Endereço de e-mail ja cadastrado."
			render(view: "cadastro_usr", model: [usuarioInstance: urc])
			
		}else{
			if (!urc.hasErrors()) {
				def usuarioInstance = new Usuario(urc.properties)
				usuarioInstance.save(flush: true)

				new Perfil(usuario: usuarioInstance,primeiroLogin: true).save(flush: true)

				flash.message = "${message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.id])}"
				redirect(action: "login", id: usuarioInstance.id)
			}
			else {
				render(view: "cadastro_usr", model: [usuarioInstance: urc])
			}
		}
	}
	
	def adm_orcm = {
		
		if(!params.mesId){
			params.mesId = DateUtils.mesAtual
		}
		
		int iMes = Integer.valueOf(params.mesId)

		def user = session.user.attach()
		def orcamento = Orcamento.findByAnoAndUser(DateUtils.anoAtual,user)
		def mes = OrcmMes.findByMesAndOrcamento(iMes,orcamento)
		
		//form de filtro
		def meses = OrcmMes.findAllByOrcamento(orcamento)
		
		List listaDebito = new ArrayList()
		def categoriasDebito = Categoria.findAllByReceitaAndUser(false,user)
		
		categoriasDebito.each { categoria ->

			ListaCategoriasBean bean = new ListaCategoriasBean()
			bean.categoria = categoria.nome
			bean.subcategorias = OrcmItem.findAllByCategoriaAndMes(categoria,mes)

			listaDebito.add bean
		}

		List listaCredito = new ArrayList()
		def categoriasCredito = Categoria.findAllByReceitaAndUser(true,user)
		
		categoriasCredito.each { categoria ->
						
			ListaCategoriasBean bean = new ListaCategoriasBean()
			bean.categoria = categoria.nome
			bean.subcategorias = OrcmItem.findAllByCategoriaAndMes(categoria,mes)

			listaCredito.add bean
		}
		
		//totais previstos
		DecimalFormat df = new DecimalFormat(Constants.FORMATO_MOEDA)
		
		BoxSaldoBean bean = new BoxSaldoBean()
		bean.entradas = orcamentoService.getTotalPrevisto(mes,true)
		bean.saidas = orcamentoService.getTotalPrevisto(mes,false)

		[ adm: true,  df: df, itensDeb: listaDebito, itensCred: listaCredito, orcmMes: mes, meses: meses, orcmBox: bean]
	}
	
	def save_itens = {
						
		def user = session.user.attach()
		def tipoSave = params?.tipoSave
		
		if(("mes").equals(tipoSave)){
			def orcmMes = OrcmMes.get(params.id)
			orcmMes.properties = params

		}else if(("ano").equals(tipoSave)){
			def orcmMes = OrcmMes.get(params.id)
			def orcamento = orcmMes.orcamento
			
			def allOrcmMes = OrcmMes.findAllByOrcamento(orcamento)
			
			allOrcmMes.each {
				it.properties = params
			}
		}

		if(tipoSave.equals("ano")){
			flash.message = "Orcamento para o Ano Salvo com Sucesso."
		}else{
			flash.message = "Orcamento para o Mes Salvo com Sucesso."
		}
		
		redirect(action:'adm_orcm')
	}
}
