<g:if test="${session.user && !ocultaMenu}">
<nav id="main-menu" class="text-center menu-icon">
	<a href="" id="mobile-menu">Menu</a>
	<div class="items">
		<g:link controller="home" class="home ${home? "active" : "" }">
			<span><g:message code="menu.label.home"/></span>
		</g:link><g:link controller="budget" class="budget ${budget? "active" : "" }">
			<span><g:message code="menu.label.budget"/></span>
		</g:link><g:link controller="cashflow" class="cashflow ${cashflow? "active" : "" }">
			<span><g:message code="menu.label.cashflow"/></span>
		</g:link><g:link controller="report" class="reports ${stats? "active" : "" }">
			<span><g:message code="menu.label.report"/></span>
		</g:link><g:link controller="goal" class="goal ${goal? "active" : "" }">
			<span><g:message code="menu.label.goal"/></span>
		</g:link><g:link controller="admin" class="admin ${adm? "active" : "" }">
			<span><g:message code="menu.label.adm"/></span>
		</g:link><g:link controller="help" class="help ${help? "active" : "" }">
			<span><g:message code="menu.label.help"/></span>
		</g:link>
	</div>
</nav>
</g:if>