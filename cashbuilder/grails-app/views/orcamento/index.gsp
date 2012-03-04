<%@page import="com.cashbuilder.utils.Constants"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <title>Sistema Grails - Orcamento</title>
        <meta name="layout" content="base" />
        <r:require modules="budget"/>
        
        <g:javascript>
        	$(function() {
				makeBudgetBars();
			});
        </g:javascript>
        
    </head>
    <body>
		<g:monthMenu month="${monthIndex}" />

		<div class="span-24">
			<div id="title">
    			<h3>${orcamento.date?.month} - ${orcamento.date?.year }</h3>
    		</div>
    	</div>

    	<div class="span-7">
			<div id="lbox">
				<g:render template="/elements/box_saldo" var="bean" bean="${balanceBox}"  ></g:render>
			</div>
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
