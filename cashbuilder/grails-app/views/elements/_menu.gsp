<g:if test="${session.user && !ocultaMenu}">
	<div class="span-4 ${home? "ativo" : "" }">
		<g:link controller="home">
			<img src="${resource(dir:'images',file:'home-icon.png')}"/>
			<br />Home
		</g:link>
	</div>    		
	<div class="span-4 ${orcm? "ativo" : "" }">
		<g:link controller="orcamento">
			<img src="${resource(dir:'images',file:'orcm-icon.png')}"/>
			<br />Orcamento
		</g:link>
	</div>
	<div class="span-4 ${flow? "ativo" : "" }">
		<g:link controller="fluxoCaixa">
			<img src="${resource(dir:'images',file:'flow-icon.png')}"/>
			<br />Fluxo de Caixa
		</g:link>
	</div>
	<div class="span-4 ${goal? "ativo" : "" }">
		<g:link controller="meta">
			<img src="${resource(dir:'images',file:'metas-icon.png')}"/>
			<br />Metas
		</g:link>
	</div>
	<div class="span-4 ${stats? "ativo" : "" }">
		<g:link controller="relatorio">
			<img src="${resource(dir:'images',file:'relatorio-icon.png')}"/>
			<br />Relatorios
		</g:link>
	</div>
	<div class="span-4 ${adm? "ativo" : "" } last">
		<g:link controller="administracao">
			<img src="${resource(dir:'images',file:'adm-icon.png')}"/>
			<br />Administracao
		</g:link>
	</div>
</g:if>

