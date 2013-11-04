<ul class="inline">

	<g:if test="${!session.user}">
		<li>
			<g:link controller="about" action="."><g:message code="app.about.link"/></g:link>
		</li>
	
		<li>
			<g:link controller="about" action="terms"><g:message code="app.terms.link"/></g:link>
		</li>
		
		<li>
			<g:link controller="contact"><g:message code="app.contact.link"/></g:link>
		</li>
	</g:if>
	<g:else>
		<li>
			<g:link elementId="contact_link" controller="contact" action="index"><g:message code="app.contact.link"/></g:link>
		</li>
	</g:else>

	<li>
		<g:link url="http://fazrico.wordpress.com" target="blank"><g:message code="app.blog.link"/></g:link>
	</li>	
</ul>
