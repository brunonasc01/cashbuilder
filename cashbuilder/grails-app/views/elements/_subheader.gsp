
<div class="subheader ui-corner-bottom">
	sub header 25px 

	<g:link controller="administracao" action="login"><strong>Login:</strong></g:link>
	
	<g:if test="${session.user}"> 
		<g:link controller="administracao"  action="logoff">sair</g:link>
	</g:if>
	<g:else>
		<g:link controller="administracao" action="cadastro_usr">registro</g:link>
	</g:else>
</div>