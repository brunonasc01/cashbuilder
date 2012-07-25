<g:if test="${session.user && !ocultaMenu}">
	<g:link controller="home">
		<div class="span-4 ${home? "ativo" : "" }">
			<span class="home"></span>
			<g:message code="menu.home.label"/>
		</div>
	</g:link>
	
	<g:link controller="budget">    		
		<div class="span-4 ${budget? "ativo" : "" }">
			<span class="budget"></span>
			<g:message code="menu.budget.label"/>
		</div>
	</g:link>
	
	<g:link controller="cashflow">
		<div class="span-4 ${cashflow? "ativo" : "" }">
			<span class="cashflow"></span>
			<g:message code="menu.cashflow.label"/>
		</div>
	</g:link>
	
	<g:link controller="goal">
		<div class="span-4 ${goal? "ativo" : "" }">
			<span class="goal"></span>
			<g:message code="menu.goal.label"/>
		</div>
	</g:link>
	
	<g:link controller="report">
		<div class="span-4 ${stats? "ativo" : "" }">
			<span class="reports"></span>
			<g:message code="menu.report.label"/>
		</div>
	</g:link>

	<g:link controller="manager">
		<div class="span-4 ${adm? "ativo" : "" } last">
			<span class="adm"></span>
			<g:message code="menu.adm.label"/>
		</div>
	</g:link>
</g:if>
