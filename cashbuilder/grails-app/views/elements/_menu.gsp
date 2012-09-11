<g:if test="${session.user && !ocultaMenu}">
	<g:link controller="home">
		<div class="${home? "ativo" : "" }">
			<span class="home"></span>
			<g:message code="menu.home.label"/>
		</div>
	</g:link>
	
	<g:link controller="budget">    		
		<div class="${budget? "ativo" : "" }">
			<span class="budget"></span>
			<g:message code="menu.budget.label"/>
		</div>
	</g:link>
	
	<g:link controller="cashflow">
		<div class="${cashflow? "ativo" : "" }">
			<span class="cashflow"></span>
			<g:message code="menu.cashflow.label"/>
		</div>
	</g:link>
	
	<g:link controller="goal">
		<div class="${goal? "ativo" : "" }">
			<span class="goal"></span>
			<g:message code="menu.goal.label"/>
		</div>
	</g:link>
	
	<g:link controller="report">
		<div class="${stats? "ativo" : "" }">
			<span class="reports"></span>
			<g:message code="menu.report.label"/>
		</div>
	</g:link>

	<g:link controller="admin">
		<div class="${adm? "ativo" : "" }">
			<span class="adm"></span>
			<g:message code="menu.adm.label"/>
		</div>
	</g:link>
	
	<g:link controller="help">
		<div class="${help? "ativo" : "" } last">
			<span class="help"></span>
			<g:message code="menu.help.label"/>
		</div>
	</g:link>
</g:if>
