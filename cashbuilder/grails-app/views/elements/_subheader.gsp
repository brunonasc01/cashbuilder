<div id="subheader">
	<ul class="inline">
	<g:if test="${showCommon}">
		<li><g:link uri="/" class="icon-home">
			<g:message code="app.link.index"/></g:link>
		</li><li><g:link controller="user" action="signup" class="icon-doc">
			<g:message code="app.link.signup"/></g:link></li>
	</g:if>
	<g:else>
		<li><g:message code="default.welcome.message"/>
			${session.user.firstName }
		</li><li><g:link controller="login" action="logoff" class="icon-unlock logoff">
			<g:message code="app.link.logoff"/></g:link></li>
	</g:else>
	</ul>
</div>