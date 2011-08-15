<%@page import="com.cashbuilder.utils.Constants"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <title>Sistema Grails - Fluxo de Caixa</title>
        <meta name="layout" content="base" />
		<link rel="stylesheet" href="<g:createLinkTo dir='css' file='cashflow.css'/>" />
		
		<g:javascript src="cashflow-ui.js" />
		
		<script type="text/javascript">
			$(function() {
				cashflow('cashflow');
			});
		</script>
    </head>
    <body>
    	<div class="span-6">
    		<div class="box new-reg ui-corner-all shadow_box">
    			<g:link controller="pagamento" action="novo" >
					<img src="${resource(dir:'images',file:'add-icon.png')}"/>
					<br />Novo Lançamento
				</g:link>
			</div>
    	
    		<div class="box saldo-csflow ui-corner-all shadow_box">
    			<h5>Totais (R$)</h5>
    		
				<div class="title span-2">Entradas</div>
				<div class="span-3 positivo last">
					<g:formatNumber number="${fluxoCaixa.entradas}" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
				</div>
				
				<div class="title span-2">Saídas</div>
				<div class="span-3 negativo last">
					<g:formatNumber number="${fluxoCaixa.saidas}" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
				</div>
				
				<g:set var="classSaldo" value="${(fluxoCaixa.saldo > 0) ? 'positivo' : 'negativo' }"></g:set>
				
				<div class="title span-2">Saldo</div>
				<div class="span-3 ${classSaldo } last">
					<g:formatNumber number="${fluxoCaixa.saldo}" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
				</div>
			</div>
    	
    		<div class="box ui-corner-all shadow_box">
	    		<g:form action="index">
	    			<fieldset>
	            		<legend>Filtro</legend>

	    				<div class="form-label span-1">
	    					<label for="mesId">Mes</label>
	    				</div>
	
	    				<div class="span-3 last">
		    				<g:select name="mesId"
								from="${meses}" 
								optionKey="mes" value="${params.mesId}" noSelection="['': 'Sel.']" />
						</div>
	    		
	    				<div class="span-2 prepend-1">
	    					<g:submitButton name="filtrar" value="Filtrar"></g:submitButton>
	    				</div>
	    			</fieldset>
				</g:form>
			</div>
    	</div>
    
    	<div class="box ui-corner-all span-16 last shadow_box">
    		<g:if test="${flash.message}">
				<div class="notice">
					${flash.message}
				</div>
			</g:if>
    	
    		<g:render template="/elements/fluxocaixa_detalhado" bean="${fluxoCaixa}"></g:render>
		</div>
	</body>		
</html>
