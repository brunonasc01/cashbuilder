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

		<div class="area-title col-1">
			<h2 class="title-box icon-budget">
				<g:message code="menu.label.budget"/> - <span><g:message code="${budget.date?.month}"/></span> / ${budget.date?.year }
			</h2>
   		</div>
   		
   		<g:monthMenu month="${monthIndex}" nextYear="${nextYear}" />
   		
   		<g:render template="/elements/message"></g:render>

		<g:if test="${!consult_mode }">
		<aside class="mobile-only col-25">
			<g:link class="side-button btn-action text-center" controller="admin" action="manage_budget">
				<g:message code="budget.manage-budget.link"/></g:link>
    	</aside>
		</g:if>

    	<div id="content" class="col-75">
			<g:render template="/elements/box_saldo" var="bean" bean="${balanceBox}"  ></g:render>

    		<g:if test="${budget}">
    			<div class="box append-top">
    				<g:if test="${budget.incomeList }">
    					<h3 class="title-box"><g:message code="budget.income.title"/></h3>
    					<g:render template="/elements/budget_list" var="list" bean="${budget.incomeList}"></g:render>
    				</g:if>

    				<g:if test="${budget.expenseList }">
    					<h3 class="title-box"><g:message code="budget.expense.title"/></h3>
						<g:render template="/elements/budget_list" var="list" bean="${budget.expenseList}"></g:render>
					</g:if>

					<g:if test="${!budget.expenseList && !budget.incomeList}">
						<div class="box">
							<div class="content">
								<g:message code="budget.empty.message"/>
							</div>
						</div>
    				</g:if>
    			</div>
    		</g:if>
		</div>
		
		<aside class="col-25">
			<g:if test="${!consult_mode }">
			<g:link class="side-button btn-action text-center" controller="admin" action="manage_budget">
				<g:message code="budget.manage-budget.link"/></g:link>
			</g:if>
			
			<a class="side-button btn-help text-center append-top" href="#"><g:message code="default.aside.help.link"/></a>
			
			<g:render template="/elements/anuncio" model="[tipo:'sidebar', divClass:'append-top']"></g:render>
		</aside>
	</body>
</html>