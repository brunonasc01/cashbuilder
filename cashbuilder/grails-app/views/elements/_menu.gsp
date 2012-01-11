<g:if test="${session.user && !ocultaMenu}">
	<g:link controller="home">
		<div class="span-4 ${home? "ativo" : "" }">
			<span class="home"></span>
			Home
		</div>
	</g:link>
	
	<g:link controller="orcamento">    		
		<div class="span-4 ${orcm? "ativo" : "" }">
			<span class="budget"></span>
			Orcamento
		</div>
	</g:link>
	
	<g:link controller="fluxoCaixa">
		<div class="span-4 ${flow? "ativo" : "" }">
			<span class="cashflow"></span>
			Fluxo de Caixa
		</div>
	</g:link>
	
	<g:link controller="meta">
		<div class="span-4 ${goal? "ativo" : "" }">
			<span class="goal"></span>
			Metas
		</div>
	</g:link>
	
	<g:link controller="relatorio">
		<div class="span-4 ${stats? "ativo" : "" }">
			<span class="reports"></span>
			Relatorios
		</div>
	</g:link>

	<g:link controller="administracao">
		<div class="span-4 ${adm? "ativo" : "" } last">
			<span class="adm"></span>
			Administracao
		</div>
	</g:link>
</g:if>
