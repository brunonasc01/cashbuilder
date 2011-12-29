package com.cashbuilder

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;
import java.util.Date;

import com.cashbuilder.beans.BoxSaldoBean;
import com.cashbuilder.beans.ListaCategoriasBean;
import com.cashbuilder.cmd.UsuarioCommand;
import com.cashbuilder.utils.Constants;
import com.cashbuilder.utils.DateUtils;

class AdministracaoController {

	def orcamentoService
	def geralService
	def eventService
	def usuarioService
	
    def index = {
	
		[adm : true]	
	}
	
	def login = {
		if(session.user){
			redirect(controller:'home')
		}
	}
	
	def valida_login = {
				
		def user = usuarioService.verifyLogin(params) 

		if(user){
			session.user = user
			def perfil = Perfil.findByUsuario(user)
			
			if(!perfil){
				redirect(controller:'perfil')
			}else {
				def budget = Orcamento.findByAnoAndUser(DateUtils.anoAtual,user)
			
				if(!budget){
					geralService.createNewBudget(user, DateUtils.anoAtual)
				}

				eventService.checkEvents(user, null)
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

		def meses = OrcmMes.findAllByOrcamento(orcamento)
		def listaDebito = orcamentoService.getOrcmItems(user,iMes,false)
		def listaCredito = orcamentoService.getOrcmItems(user,iMes,true)
		def df = geralService.getFormatadorNumerico()

		BoxSaldoBean bean = new BoxSaldoBean()
		bean.entradas = orcamentoService.getTotalPrevisto(mes,true)
		bean.saidas = orcamentoService.getTotalPrevisto(mes,false)

		[ adm: true, df: df, itensDeb: listaDebito, itensCred: listaCredito, orcmMes: mes, meses: meses, orcmBox: bean]
	}
	
	def save_itens = {
		try{
			def user = session.user.attach()
			def tipoSave = params.tipoSave
			geralService.saveManualBudget(user,params.id,tipoSave,params.properties)

			if(tipoSave.equals("ano")){
				flash.message = "Orcamento para o Ano Salvo com Sucesso."
			}else{
				flash.message = "Orcamento para o Mes Salvo com Sucesso."
			}
		} catch(RuntimeException re){
			flash.message = re.message
		}

		redirect(action:'adm_orcm')
	}
	
	def validator = { UsuarioCommand urc ->
		
		def fieldName = params.fieldName

		if(fieldName.equals("FORM") && (urc.errors.hasFieldErrors("email") || urc.errors.hasFieldErrors("password"))){
			render "${message(code: 'default.form.error.message', default: 'erro')}"
		} else if(fieldName && urc.errors.hasFieldErrors(fieldName)){
			render g.renderErrors(bean: urc,field: fieldName)
		}else {
			render ""
		}
	}
}
