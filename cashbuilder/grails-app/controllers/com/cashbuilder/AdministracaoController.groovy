package com.cashbuilder

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;
import java.util.Date;

import com.cashbuilder.beans.BoxSaldoBean;
import com.cashbuilder.beans.ListaCategoriasBean;
import com.cashbuilder.cmd.UsuarioRegistroCommand;
import com.cashbuilder.eventos.EventManager;
import com.cashbuilder.utils.Constants;
import com.cashbuilder.utils.DateUtils;

class AdministracaoController {

	def orcamentoService
	def geralService
	
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
				EventManager evtManager = new EventManager()
				evtManager.checkEvents(session.user, null)

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
			bean.subcategorias = OrcmItem.findAllByCategoriaAndMes(categoria,mes,[sort:"subcategoria"])

			listaDebito.add bean
		}

		List listaCredito = new ArrayList()
		def categoriasCredito = Categoria.findAllByReceitaAndUser(true,user)
		
		categoriasCredito.each { categoria ->
						
			ListaCategoriasBean bean = new ListaCategoriasBean()
			bean.categoria = categoria.nome
			bean.subcategorias = OrcmItem.findAllByCategoriaAndMes(categoria,mes,[sort:"subcategoria"])

			listaCredito.add bean
		}
		
		//totais previstos
		def df = geralService.getFormatadorNumerico()
		
		BoxSaldoBean bean = new BoxSaldoBean()
		bean.entradas = orcamentoService.getTotalPrevisto(mes,true)
		bean.saidas = orcamentoService.getTotalPrevisto(mes,false)

		[ adm: true, df: df, itensDeb: listaDebito, itensCred: listaCredito, orcmMes: mes, meses: meses, orcmBox: bean]
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
	
	def validator = { UsuarioRegistroCommand urc ->
		
		def fieldName = params.fieldName

		if(fieldName.equals("FORM") && (urc.errors.hasFieldErrors("email") || urc.errors.hasFieldErrors("password"))){
			render "${message(code: 'default.invalid.data.message', default: 'erro')}"
		} else if(fieldName && urc.errors.hasFieldErrors(fieldName)){
			render g.renderErrors(bean: urc,field: fieldName)
		}else {
			render ""
		}
	}
}
