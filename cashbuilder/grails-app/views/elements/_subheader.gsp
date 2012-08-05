
<div class="subheader">

	<g:if test="${session.user}">
		<span>
			<g:message code="default.welcome.message"/>
			${session.user.firstName }
		</span>
		<span> | </span>

		<g:link controller="login" action="logoff">
			<g:message code="default.logoff.label"/>
		</g:link>
	</g:if>
	<g:else>
		<g:if test="${signup || login}">
			<g:link uri="/">
				<g:message code="default.start.label"/>
			</g:link>
		</g:if>
		<g:else>
			<a href="javascript:autoModal('dialog');">
				<g:message code="default.login.label"/>
			</a>
		</g:else>

		<span> | </span>
		<g:link controller="user" action="signup">
			<g:message code="default.signup.label"/>
		</g:link>
	</g:else>
</div>