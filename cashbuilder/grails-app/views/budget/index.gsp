<%@page import="com.cashbuilder.Constants"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta name="layout" content="base" />
        <r:require modules="budget"/>
        
        <g:javascript>
		initBudgetScripts();
        </g:javascript>
    </head>
    <body>
		<g:monthMenu month="${monthIndex}" nextYear="${nextYear}" />

		<div id="month-title" class="col-1">
			<h2 class="title-box">
				<g:message code="menu.label.budget"/> - <span><g:message code="${budget.date?.month}"/></span> / ${budget.date?.year }
			</h2>
   		</div>
   		
   		<g:render template="/elements/message"></g:render>

    	<div class="col-25">
			<g:render template="/elements/box_saldo" var="bean" bean="${balanceBox}"  ></g:render>
    	</div>
    
    	<div class="col-66">
    		<g:if test="${budget }">
    			<div class="box">

    				<g:if test="${budget.incomeList }">
    					<h3 class="title-box"><g:message code="budget.income.title"/></h3>

    					<g:render template="/elements/orcamento_basico" var="list" bean="${budget.incomeList}"></g:render>
    				</g:if>

    				<g:if test="${budget.expenseList }">
    					<h3 class="title-box"><g:message code="budget.expense.title"/></h3>

						<g:render template="/elements/orcamento_basico" var="list" bean="${budget.expenseList}"></g:render>
					</g:if>

					<g:if test="${!budget.expenseList && !budget.incomeList}">
	    				<div class="empty-box">
	    					<g:message code="budget.empty.message"/>
	    				</div>
    				</g:if>
    			</div>
    		</g:if>
		</div>
	</body>		
</html>
