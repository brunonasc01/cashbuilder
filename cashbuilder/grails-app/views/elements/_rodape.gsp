
<g:if test="${session.user}">

	<%@page import="com.cashbuilder.DateUtils"%>
	
	<g:message code="app.name" /> ${DateUtils.currentYear}

</g:if>
<g:else>
	<g:link controller="home" action="about"><g:message code="app.about.link"/></g:link>
	<span> | </span>
	<a href="#"><g:message code="app.terms.link"/></a>
	<span> | </span>
	<g:link url="http://fazrico.wordpress.com" target="blank"><g:message code="app.blog.link"/></g:link>
	<span> | </span>
	<g:link controller="home" action="contact"><g:message code="app.contact.link"/></g:link>
	
	<%--		<img src="${resource(dir:'images',file:'facebook-icon.png')}"/>--%>
			
	<%--		<img src="${resource(dir:'images',file:'twitter-icon.png')}"/>--%>
</g:else>