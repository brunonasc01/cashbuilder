<g:if test="${session.user}">
	<div class="span-4">
		<div class="menu">
		<g:link controller="home" >Home</g:link>
		</div>
	</div>
	
	<div class="span-4">
		<div class="menu">
			<g:link controller="orcamento" >Orçamento</g:link>
		</div>
	</div>
	
	<div class="span-4">
		<div class="menu">
			<g:link controller="fluxoCaixa" >Fluxo de Caixa</g:link>
		</div>
	</div>
	
	<div class="span-4">
		<div class="menu">
		Metas 75px
		</div>
	</div>
	
	<div class="span-4">
		<div class="menu">
		Analises 75px
		</div>
	</div>
	
	<div class="span-4 last">
		<div class="menu">
			<g:link controller="administracao" >Administracao</g:link>
		</div>
	</div>
</g:if>