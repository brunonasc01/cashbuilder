<g:if test="${session.user && !ocultaMenu}">
<div class="col-1">
<nav id="main-menu" class="text-center menu-icon">
	<a href="" id="mobile-menu">Menu</a>
	<div class="items">
		<g:link controller="home" class="${home? "active" : "" }">
			<span class="icon-home"></span><b><g:message code="menu.label.home"/></b>
		</g:link><g:link controller="budget" class="${budget? "active" : "" }">
			<span class="icon-budget"></span><b><g:message code="menu.label.budget"/></b>
		</g:link><g:link controller="cashflow" class="${cashflow? "active" : "" }">
			<span class="icon-cashflow"></span><b><g:message code="menu.label.cashflow"/></b>
		</g:link><g:link controller="report" class="${stats? "active" : "" }">
			<span class="icon-reports"></span><b><g:message code="menu.label.report"/></b>
		</g:link><g:link controller="goal" class=" ${goal? "active" : "" }">
			<span class="icon-goal"></span><b><g:message code="menu.label.goal"/></b>
		</g:link><g:link controller="admin" class="${adm? "active" : "" }">
			<span class="icon-admin"></span><b><g:message code="menu.label.adm"/></b>
		</g:link><g:link controller="help" class="${help? "active" : "" }">
			<span class="icon-help"></span><b><g:message code="menu.label.help"/></b>
		</g:link>
	</div>
</nav>
</div>
</g:if>