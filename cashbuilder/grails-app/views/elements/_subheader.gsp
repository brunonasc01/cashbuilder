
<div class="subheader">
	sub header 25px 

	<g:link controller="administracao" action="login">login</g:link>

	<g:if test="${session.user}"> 
		<g:link controller="administracao"  action="logoff">sair</g:link>
	</g:if>
	<g:else>
		<g:link controller="administracao" action="cadastro_usr">registro</g:link>
	</g:else>
</div>