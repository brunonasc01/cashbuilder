
<div class="subheader">

	<g:if test="${session.user}">
		<span>
			<g:message code="default.welcome.message" default="Welcome" />
			${session.user.firstName }
		</span>
		<span> | </span>

		<g:link controller="login" action="logoff">
			<g:message code="default.logoff.label" default="logoff" />
		</g:link>
	</g:if>
	<g:else>
		<a href="javascript:autoModal('dialog');">
			<g:message code="default.login.label" default="login" />
		</a>
		<span> | </span>
		<g:link controller="user" action="signup">
			<g:message code="default.signup.label" default="signup" />
		</g:link>
	</g:else>
</div>