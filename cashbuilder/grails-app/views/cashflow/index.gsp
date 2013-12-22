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
		<div class="area-title col-1">
			<h2 class="title-box icon-cashflow">
				<g:message code="menu.label.cashflow"/> - <g:message code="${cashFlow.date.month}"/> / ${cashFlow.date.year}
			</h2>
   		</div>
    	
    	<g:monthMenu month="${monthIndex}" nextYear="${nextYear}" />
    	
    	<g:render template="/elements/message"></g:render>
    	
    	<div class="col-25">
    		<g:if test="${!consult_mode }">
	    		<div class="text-center append-bottom-dist">
					<g:form name="newTransactionForm" action="create" controller="transaction">
						<g:hiddenField name="monthId" value="${monthIndex}" />
						<g:submitButton name="newButton" class="btn btn-large" value="${g.message(code:'form.transaction.title')}" />
					</g:form>
				</div>
			</g:if>

    		<g:render template="/elements/box_saldo" var="bean" bean="${balanceBox }"  ></g:render>
    	</div>
    
    	<div class="col-75">
    		<div class="box">
		    	<g:render template="/elements/cashflow_transaction_list" bean="${cashFlow}"></g:render>
	    	</div>
		</div>
	</body>		
</html>
