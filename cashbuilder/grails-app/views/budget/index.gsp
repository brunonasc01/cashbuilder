<%@page import="com.cashbuilder.Constants"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
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

		<div id="title" class="rounded-all">
   			<p><g:message code="${budget.date?.month}"/> - ${budget.date?.year }</p>
   		</div>
   		
   		<g:if test="${flash.message}">
   			<div class="inside">
				<div class="success">
					${flash.message}
				</div>
			</div>
		</g:if>

    	<div class="span-7">
			<div id="lbox">
				<g:render template="/elements/box_saldo" var="bean" bean="${balanceBox}"  ></g:render>
			</div>
    	</div>
    
    	<div class="span-17 last">
    		<g:if test="${budget }">
    			<div id="rbox">

    				<g:if test="${budget.incomeList }">
    					<div class="title"><g:message code="budget.income.title"/></div>
    					
    					<div class="inside">
    						<g:render template="/elements/orcamento_basico" var="list" bean="${budget.incomeList}"></g:render>
    					</div>
    				</g:if>
    				
    				<div class="clear"></div>
    				
    				<g:if test="${budget.expenseList }">
						<div class="title rounded-none"><g:message code="budget.expense.title"/></div>
						<div class="inside">
							<g:render template="/elements/orcamento_basico" var="list" bean="${budget.expenseList}"></g:render>
						</div>
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
