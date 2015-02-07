<%@page import="com.cashbuilder.Constants"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta name="layout" content="base" />
		<asset:stylesheet src="cashflow.css"/>
        <asset:javascript src="system.js"/>

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
    	
    	<g:if test="${deletedBean}">
    		<div class="col-1">
    			<div class="message error">
    				<g:form name="undeleteForm" action="undelete" controller="transaction">
    					<g:hiddenField name="date" value="${deletedBean.date}"/>
    					<g:hiddenField name="nature" value="${deletedBean.nature}"/>
    					<g:hiddenField name="description" value="${deletedBean.description}"/>
    					<g:hiddenField name="category" value="${deletedBean.category.id}"/>
    					<g:hiddenField name="subcategory" value="${deletedBean.subcategory.id}"/>
						<g:hiddenField name="parcels" value="${deletedBean.parcels}"/>
    					<g:hiddenField name="value" value="${df.format(deletedBean.value)}"/>
    					
    					<p><g:link class="text_link" elementId="unDeleteLink" action="undelete"><g:message code="form.transaction.delete.undo"/></g:link></p>
    				</g:form>
    			</div>
    		</div>
    	</g:if>
    	
    	<g:if test="${!consult_mode }">
		<aside class="mobile-only col-25">
			<g:form name="newTransactionForm" action="create" controller="transaction">
				<g:hiddenField name="monthId" value="${monthIndex}" />
				<g:submitButton name="newButton" class="side-button btn-action" value="${g.message(code:'form.transaction.btn.title')}" />
			</g:form>
    	</aside>
		</g:if>

    	<div id="content" class="col-75">
    		<g:render template="/elements/box_saldo" var="bean" bean="${balanceBox }"  ></g:render>
    
    		<div class="box append-top">
		    	<g:render template="/elements/cashflow_transaction_list" bean="${cashFlow}"></g:render>
	    	</div>
		</div>
    	
		<aside class="col-25">
		<g:if test="${!consult_mode }">
			<g:form name="newTransactionForm" action="create" controller="transaction">
				<g:hiddenField name="monthId" value="${monthIndex}" />
				<g:submitButton name="newButton" class="side-button btn-action" value="${g.message(code:'form.transaction.btn.title')}" />
			</g:form>
		</g:if>	
			<g:render template="/elements/anuncio" model="[tipo:'sidebar', divClass:'append-top']"></g:render>
    	</aside>
	</body>		
</html>
