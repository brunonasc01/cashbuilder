package com.cashbuilder

import java.text.DecimalFormat;
import java.util.Date;

import com.cashbuilder.beans.administracao.OrcmAdmBoxBean;
import com.cashbuilder.beans.administracao.OrcmMesBean;
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

				File file = grailsAttributes.getApplicationContext().getResource("res/categorias.csv").getFile()
				usuarioService.initUser(usuarioInstance,file)

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
		
		//form de filtro
		def orcamentos = Orcamento.findAllByUser(user)
		def meses = OrcmMes.findAllByOrcamento(orcamento)
		
		List lsItensDeb = new ArrayList()
		def categoriasDeb = Categoria.findAllByReceitaAndUser(false,user)
		
		categoriasDeb.each { categoria ->

			OrcmMesBean bean = new OrcmMesBean()
			bean.categoria = categoria.nome
			bean.subcategorias = OrcmItem.findAllByCategoriaAndMes(categoria,mes)

			lsItensDeb.add bean
		}

		List lsItensCred = new ArrayList()
		def categoriasCredito = Categoria.findAllByReceitaAndUser(true,user)
		
		categoriasCredito.each { categoria ->
						
			OrcmMesBean bean = new OrcmMesBean()
			bean.categoria = categoria.nome
			bean.subcategorias = OrcmItem.findAllByCategoriaAndMes(categoria,mes)

			lsItensCred.add bean
		}
		
		//totais previstos
		DecimalFormat df = new DecimalFormat(Constants.moneyMask)
		
		OrcmAdmBoxBean bean = new OrcmAdmBoxBean()
		bean.entradas = orcamentoService.calcTotalPrev(mes,true)
		bean.saidas = orcamentoService.calcTotalPrev(mes,false)
		bean.saldo = orcamentoService.calcSaldoPrevisto(mes)
				
		
		[itensDeb: lsItensDeb, itensCred: lsItensCred, orcmMes: mes, anos: orcamentos, meses: meses,
			orcmBox: bean, df: df, adm:true ]
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
