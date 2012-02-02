
<div class="subheader">

	<g:if test="${session.user}">
		<span>Bem vindo ${session.user.nome }</span>
		<span> | </span>	
				
		<g:link controller="login" action="logoff">sair</g:link>
	</g:if>
	<g:else>
		<g:link controller="login" >Login</g:link>
		<span> | </span>
		<g:link controller="usuario" action="novo">registro</g:link>
	</g:else>
</div>