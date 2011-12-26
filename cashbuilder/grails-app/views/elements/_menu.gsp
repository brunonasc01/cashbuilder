<g:if test="${session.user && !ocultaMenu}">
	<div class="equ span-4"><g:link controller="home">Home</g:link></div>    		
	<div class="diff span-4"><g:link controller="orcamento">Orcamento</g:link></div>
	<div class="equ span-4"><g:link controller="fluxoCaixa">Fluxo de Caixa</g:link></div>
	<div class="diff span-4"><g:link controller="meta">Metas</g:link></div>
	<div class="equ span-4"><g:link controller="relatorio">Relatorios</g:link></div>
	<div class="diff span-4 last"><g:link controller="administracao">Administracao</g:link></div>
</g:if>

