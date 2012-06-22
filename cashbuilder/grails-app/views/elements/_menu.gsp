<g:if test="${session.user && !ocultaMenu}">
	<g:link controller="home">
		<div class="span-4 ${home? "ativo" : "" }">
			<span class="home"></span>
			Home
		</div>
	</g:link>
	
	<g:link controller="budget">    		
		<div class="span-4 ${budget? "ativo" : "" }">
			<span class="budget"></span>
			Orcamento
		</div>
	</g:link>
	
	<g:link controller="cashflow">
		<div class="span-4 ${cashflow? "ativo" : "" }">
			<span class="cashflow"></span>
			Fluxo de Caixa
		</div>
	</g:link>
	
	<g:link controller="goal">
		<div class="span-4 ${goal? "ativo" : "" }">
			<span class="goal"></span>
			Metas
		</div>
	</g:link>
	
	<g:link controller="report">
		<div class="span-4 ${stats? "ativo" : "" }">
			<span class="reports"></span>
			Relatorios
		</div>
	</g:link>

	<g:link controller="manager">
		<div class="span-4 ${adm? "ativo" : "" } last">
			<span class="adm"></span>
			Administracao
		</div>
	</g:link>
</g:if>
