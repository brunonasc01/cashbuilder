<g:if test="${session.user && !ocultaMenu}">
<nav id="main-menu" class="text-center menu-icon">
	<g:link controller="home" class="home ${home? "active" : "" }">
		<span><g:message code="menu.home.label"/></span>
	</g:link><g:link controller="budget" class="budget ${budget? "active" : "" }">
		<span><g:message code="menu.budget.label"/></span>
	</g:link><g:link controller="cashflow" class="cashflow ${cashflow? "active" : "" }">
		<span><g:message code="menu.cashflow.label"/></span>
	</g:link><g:link controller="report" class="reports ${stats? "active" : "" }">
		<span><g:message code="menu.report.label"/></span>
	</g:link><g:link controller="goal" class="goal ${goal? "active" : "" }">
		<span><g:message code="menu.goal.label"/></span>
	</g:link><g:link controller="admin" class="admin ${adm? "active" : "" }">
		<span><g:message code="menu.adm.label"/></span>
	</g:link><g:link controller="help" class="help ${help? "active" : "" }">
		<span><g:message code="menu.help.label"/></span>
	</g:link>
</nav>
</g:if>