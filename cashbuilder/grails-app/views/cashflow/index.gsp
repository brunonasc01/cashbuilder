<%@page import="com.cashbuilder.utils.Constants"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <meta name="layout" content="base" />
		<r:require modules="cashflow"/>

		<g:javascript>
		$(function() {
			ajaxSubmit('newButton','modal');
		});
		</g:javascript>
    </head>
    <body>
		<g:monthMenu month="${monthIndex}" />

    	<div class="span-24">
			<div id="title">
    			<h3>${cashFlow.date.month} - ${cashFlow.date.year}</h3>
    		</div>
    	</div>
    	
    	<div class="span-7">
    		<div id="lbox">
    			<div class="inside center">
					<g:form action="newTransaction" controller="pagamento">
						<g:hiddenField name="mesId" value="${monthIndex}" />
						<g:submitButton name="newButton" class="boxButton" value="Novo Lancamento" />
					</g:form>
				</div>
			</div>

    		<div id="lbox">
    			<g:render template="/elements/box_saldo" var="bean" bean="${balanceBox }"  ></g:render>
			</div>
    	</div>
    
    	<div class="span-17 last">
    		<div id="rbox">
    			<div id="modal">
		    		<g:if test="${flash.message}">
						<div class="notice">
							${flash.message}
						</div>
					</g:if>
		    	
		    		<g:render template="/elements/fluxocaixa_detalhado" bean="${cashFlow}"></g:render>
	    		</div>
    		</div>
		</div>
	</body>		
</html>
