
<div class="subheader">

	<g:if test="${session.user}">
		<span>
			<g:message code="default.welcome.message" default="Welcome" />
			${session.user.nome }
		</span>
		<span> | </span>	
				
		<g:link controller="login" action="logoff">
			<g:message code="default.logoff.label" default="logoff" />
		</g:link>
	</g:if>
	<g:else>
		<g:link controller="login">
			<g:message code="default.login.label" default="login" />
		</g:link>
		<span> | </span>
		<g:link controller="usuario" action="novo">
			<g:message code="default.signup.label" default="signup" />
		</g:link>
	</g:else>
</div>