<%@page import="com.cashbuilder.utils.Constants"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <title>Sistema Grails - Orcamento</title>
        <meta name="layout" content="base" />
        <link rel="stylesheet" href="<g:createLinkTo dir='css' file='budget.css'/>" />
        
        <g:javascript>
        	$(function() {
				makeBudgetBars();
			});
        </g:javascript>
        
    </head>
    <body>
    	<g:render template="/elements/month_menu" var="index" bean="${monthIndex}"></g:render>

		<div class="span-24">
			<div id="title">
    			<h3>${orcamento.mes} - ${orcamento.ano }</h3>
    		</div>
    	</div>

    	<div class="span-7">
			<g:if test="${boxSaldo }">
				<div id="lbox">
					<div class="title">Saldo</div>
					
					<div class="inside">
						<g:set var="classPrevisto" value="${(boxSaldo.saldoPrevisto > 0) ? 'positivo' : 'negativo' }"></g:set>
						<ul>
							<li>
								Previsto
								<g:formatNumber number="${boxSaldo.saldoPrevisto }" currencySymbol="" format="${Constants.FORMATO_MOEDA}"/>
							</li>
							
							<li>
								Realizado
								<g:formatNumber number="${boxSaldo.saldoRealizado }" currencySymbol="" format="${Constants.FORMATO_MOEDA}"/>
							</li>
						</ul>
					</div>
				</div>
			</g:if>
    	</div>
    
    	<div class="span-17 last">
    		<g:if test="${orcamento }">
    			<div id="rbox">

    				<g:if test="${orcamento.listaCredito }">
    					<div class="title">ENTRADAS</div>
    					
    					<div class="inside">
    						<g:render template="/elements/orcamento_basico" var="list" bean="${orcamento.listaCredito}"></g:render>
    					</div>
    				</g:if>
    				
    				<div class="clear"></div>
    				
    				<g:if test="${orcamento.listaDebito }">
						<div class="title">SAIDAS</div>
						<div class="inside">
							<g:render template="/elements/orcamento_basico" var="list" bean="${orcamento.listaDebito}"></g:render>
						</div>
					</g:if>
    			</div>
    		</g:if>
		</div>
	</body>		
</html>
