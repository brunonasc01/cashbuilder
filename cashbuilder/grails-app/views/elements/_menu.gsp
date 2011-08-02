<g:if test="${session.user}">
	<div class="span-4">
		<div class="menu ui-corner-top ${home? "ativo" : "" }">
			<g:link controller="home" >
				<img src="${resource(dir:'images',file:'home-icon.png')}"/>
				<br />Home
			</g:link>
		</div>
	</div>
	
	<div class="span-4">
		<div class="menu ui-corner-top ${orcm? "ativo" : "" }">
			<g:link controller="orcamento" >
				<img src="${resource(dir:'images',file:'orcm-icon.png')}"/>
				<br />Orçamento
			</g:link>
		</div>
	</div>
	
	<div class="span-4">
		<div class="menu ui-corner-top ${flow? "ativo" : "" }">
			<g:link controller="fluxoCaixa" >
				<img src="${resource(dir:'images',file:'flow-icon.png')}"/>
				<br />Fluxo de Caixa
			</g:link>
		</div>
	</div>
	
	<div class="span-4">
		<div class="menu ui-corner-top ${goal? "ativo" : "" }">
			<g:link controller="meta" >
				<img src="${resource(dir:'images',file:'metas-icon.png')}"/>
				<br />Metas
			</g:link>
		</div>
	</div>
	
	<div class="span-4">
		<div class="menu ui-corner-top ${stats? "ativo" : "" }">
			<g:link controller="relatorio" >
				<img src="${resource(dir:'images',file:'relatorio-icon.png')}"/>
				<br />Relatórios
			</g:link>
		</div>
	</div>
	
	<div class="span-4 last">
		<div class="menu ui-corner-top ${adm? "ativo" : "" }">
			<g:link controller="administracao" >
				<img src="${resource(dir:'images',file:'adm-icon.png')}"/>
				<br />Administracao
			</g:link>
		</div>
	</div>
</g:if>