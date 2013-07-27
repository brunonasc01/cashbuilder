<div id="subheader">
	<g:if test="${session.user}">
		<ul class="inline">
			<li>
				<g:message code="default.welcome.message"/>
				${session.user.firstName }
			</li><li>
				<g:link controller="login" action="logoff" class="icon-unlock">
					<g:message code="default.logoff.label"/>
				</g:link>
			</li>
		</ul>
	</g:if>
	<g:else>
		<g:if test="${request.forwardURI.equals("/") }">
			<a href="javascript:autoModal('dialog');">
				<span class="lock-icon"><g:message code="default.login.label"/></span>
			</a>
		</g:if>
		<g:else>
			<ul class="inline">
				<li>
					<g:link uri="/" class="icon-home">
						<g:message code="default.start.label"/>
					</g:link>
				</li><li>
					<g:link controller="user" action="signup" class="icon-doc">
						<g:message code="default.signup.label"/>
					</g:link>
				</li>
			</ul>
		</g:else>		
	</g:else>
</div>