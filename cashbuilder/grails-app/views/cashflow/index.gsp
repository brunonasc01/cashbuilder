<%@page import="com.cashbuilder.Constants"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta name="layout" content="base" />
		<r:require modules="cashflow"/>

		<g:javascript>
		initCashflowScripts();
		</g:javascript>
    </head>
    <body>
		<g:monthMenu month="${monthIndex}" nextYear="${nextYear}" />

		<div id="month-title" class="col-1">
			<h2 class="title-box">
				<g:message code="menu.cashflow.label"/> - <g:message code="${cashFlow.date.month}"/> / ${cashFlow.date.year}
			</h2>
   		</div>
    	
    	<g:render template="/elements/message"></g:render>
    	
    	<div class="col-25">
    		<div class="text-center append-bottom-dist">
				<g:form name="newTransactionForm" action="newTransaction" controller="transaction">
					<g:hiddenField name="monthId" value="${monthIndex}" />
					<g:submitButton name="newButton" class="btn btn-large" value="${g.message(code:'box.transaction.title')}" />
				</g:form>
			</div>

    		<g:render template="/elements/box_saldo" var="bean" bean="${balanceBox }"  ></g:render>
    	</div>
    
    	<div class="col-75">
    		<div class="box">
		    	<g:render template="/elements/fluxocaixa_detalhado" bean="${cashFlow}"></g:render>
	    	</div>
		</div>
	</body>		
</html>
