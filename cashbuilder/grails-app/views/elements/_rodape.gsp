<ul class="inline">
<g:if test="${showCommon || !session.user}">
	<li><g:link controller="about" action="."><g:message code="app.link.about"/></g:link></li>
	<li><g:link controller="about" action="terms"><g:message code="app.link.terms"/></g:link></li>
	<li><g:link controller="contact"><g:message code="app.link.contact"/></g:link></li>
</g:if>
<g:else>
	<li><g:link elementId="contact_link" controller="contact" action="index"><g:message code="app.link.contact"/></g:link></li>
</g:else>
	<li><g:link url="http://fazrico.wordpress.com" target="blank"><g:message code="app.link.blog"/></g:link></li>
</ul>