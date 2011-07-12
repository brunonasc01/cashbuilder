
<div class="subheader ui-corner-bottom">

	<g:if test="${session.user}">
		<span>Bem vindo ${session.user.nome }</span>
		<span> | </span>	
				
		<g:link controller="administracao" action="logoff">sair</g:link>
	</g:if>
	<g:else>
		<g:link controller="administracao" action="login">Login</g:link>
		<span> | </span>
		<g:link controller="administracao" action="cadastro_usr">registro</g:link>
	</g:else>
</div>