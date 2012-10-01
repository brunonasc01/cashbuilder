
<div class="subheader">

	<g:if test="${session.user}">
		<span>
			<g:message code="default.welcome.message"/>
			${session.user.firstName }
		</span>
		<span> | </span>

		<g:link controller="login" action="logoff">
			<span class="unlock-icon"><g:message code="default.logoff.label"/></span>
		</g:link>
	</g:if>
	<g:else>
		<g:if test="${request.forwardURI.equals("/") }">
			<a href="javascript:autoModal('dialog');">
				<span class="lock-icon"><g:message code="default.login.label"/></span>
			</a>
		</g:if>
		<g:else>
			<g:link uri="/">
				<g:message code="default.start.label"/>
			</g:link>
		</g:else>

		<span> | </span>
		<g:link controller="user" action="signup">
			<g:message code="default.signup.label"/>
		</g:link>
	</g:else>
</div>