<g:if test="${type == "header" }">
	<nav id="main-menu" class="text-center menu-icon">

		<div class="items">
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
		</div>
	</nav>
</g:if>
<g:elseif test="${type == "footer" }">
	<div class="box-footer-links right-align text-right">
		<ul class="inline">
			<li><a href="">Inicio</a>
			</li><li><a href="#">Topo</a>
			</li>
		</ul>		            	
	</div>
</g:elseif>

