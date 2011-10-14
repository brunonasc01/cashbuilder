<%@page import="com.cashbuilder.utils.Constants"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <title>Sistema Grails - Orcamento</title>
        <meta name="layout" content="base" />
        <link rel="stylesheet" href="<g:createLinkTo dir='css' file='orcm.css'/>" />
        
        <g:javascript>
        	$(function() {
				monthMenuUI('${monthIndex}','month_list');
				makeBudgetBars();
			});
        </g:javascript>
        
    </head>
    <body>
    	<g:render template="/elements/month_menu"></g:render>

    	<div class="span-6">
			<div class="box ui-corner-all shadow_box">
				<g:if test="${params.viewType.equals(Constants.BASICO)}">
					<g:link action="index" params="[viewType:'COMPLETO']">
						Ver em Detalhe
					</g:link>
				</g:if>
				<g:else>
					<g:link action="index" params="[viewType:'BASICO']">
						Ver Resumo
					</g:link>
				</g:else>
			</div>
			
			<g:if test="${boxSaldo }">
				<div class="box saldo-orcm ui-corner-all shadow_box">
					<h5>Saldo (R$)</h5>

					<g:set var="classPrevisto" value="${(boxSaldo.saldoPrevisto > 0) ? 'positivo' : 'negativo' }"></g:set>

					<div class="title span-2">Previsto</div>
					<div class="span-2 ${classPrevisto } last">
						<g:formatNumber number="${boxSaldo.saldoPrevisto }" currencySymbol="" format="${Constants.FORMATO_MOEDA}"/>
					</div>
					
					<g:set var="classRealizado" value="${(boxSaldo.saldoRealizado > 0) ? 'positivo' : 'negativo' }"></g:set>
					
					<div class="title span-2">Realizado</div>
					<div class="span-2 ${classRealizado } last">
						<g:formatNumber number="${boxSaldo.saldoRealizado }" currencySymbol="" format="${Constants.FORMATO_MOEDA}"/>
					</div>
				</div>
			</g:if>
    	</div>
    
    	<div class="box ui-corner-all span-16 last shadow_box">
    		<g:if test="${params.viewType.equals(Constants.BASICO)}">
    			<g:render template="/elements/orcamento_basico" bean="${orcamento}"></g:render>
    		</g:if>
    		<g:else>
    			<g:render template="/elements/orcamento_detalhado" bean="${orcamento}"></g:render>
    		</g:else>
		</div>
	</body>		
</html>
