<g:if test="${session.user && !ocultaMenu}">
<nav id="main-menu" class="text-center menu-icon">
	<a href="" id="mobile-menu">Menu</a>
	<div class="items">
		<g:link controller="home" class="${home? "active" : "" }">
			<span class="home"></span><g:message code="menu.label.home"/>
		</g:link><g:link controller="budget" class="${budget? "active" : "" }">
			<span class="budget"></span><g:message code="menu.label.budget"/>
		</g:link><g:link controller="cashflow" class="${cashflow? "active" : "" }">
			<span class="cashflow"></span><g:message code="menu.label.cashflow"/>
		</g:link><g:link controller="report" class="${stats? "active" : "" }">
			<span class="reports"></span><g:message code="menu.label.report"/>
		</g:link><g:link controller="goal" class=" ${goal? "active" : "" }">
			<span class="goal"></span><g:message code="menu.label.goal"/>
		</g:link><g:link controller="admin" class="${adm? "active" : "" }">
			<span class="admin"></span><g:message code="menu.label.adm"/>
		</g:link><g:link controller="help" class="${help? "active" : "" }">
			<span class="help"></span><g:message code="menu.label.help"/>
		</g:link>
	</div>
</nav>
</g:if>