<%@page import="com.cashbuilder.Constants"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <meta name="layout" content="base" />
		<r:require modules="cashflow"/>

		<r:script disposition="head">
		$(function() {
			ajaxSubmitToModal('newButton','dialog');
		});
		</r:script>
    </head>
    <body>
		<g:monthMenu month="${monthIndex}" />

		<div id="title" class="rounded-all">
   			<p><g:message code="${cashFlow.date.month}"/> - ${cashFlow.date.year}</p>
   		</div>
    	
    	<g:if test="${flash.message}">
    		<div class="span-24">
				<div class="form-errors-large">
					${flash.message}
				</div>
			</div>
		</g:if>
    	
    	<div class="span-7">
    		<div id="lbox">
    			<div class="inside center">
					<g:form action="newTransaction" controller="transaction">
						<g:hiddenField name="monthId" value="${monthIndex}" />
						<g:submitButton name="newButton" class="boxButton" value="Novo Lancamento" />
					</g:form>
				</div>
			</div>

    		<div id="lbox">
    			<g:render template="/elements/box_saldo" var="bean" bean="${balanceBox }"  ></g:render>
			</div>
    	</div>
    
    	<div class="span-17 last">
	    	<g:render template="/elements/fluxocaixa_detalhado" bean="${cashFlow}"></g:render>
		</div>
		
		<div class="span-16 popup-min-size" id="dialog">
			<div id="popup">	
		
			</div>
		</div>
	</body>		
</html>
