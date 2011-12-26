<g:if test="${session.user && !ocultaMenu}">
	<div class="span-4 ${home? "ativo" : "" }"><g:link controller="home">Home</g:link></div>    		
	<div class="span-4 ${orcm? "ativo" : "" }"><g:link controller="orcamento">Orcamento</g:link></div>
	<div class="span-4 ${flow? "ativo" : "" }"><g:link controller="fluxoCaixa">Fluxo de Caixa</g:link></div>
	<div class="span-4 ${goal? "ativo" : "" }"><g:link controller="meta">Metas</g:link></div>
	<div class="span-4 ${stats? "ativo" : "" }"><g:link controller="relatorio">Relatorios</g:link></div>
	<div class="span-4 ${adm? "ativo" : "" } last"><g:link controller="administracao">Administracao</g:link></div>
</g:if>

