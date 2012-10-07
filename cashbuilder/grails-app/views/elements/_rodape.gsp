
<g:if test="${session.user}">

	<%@page import="com.cashbuilder.DateUtils"%>
	
	<g:message code="app.name" /> ${DateUtils.currentYear}

</g:if>
<g:else>
	<g:link controller="home" action="about">SOBRE</g:link>
	<span> | </span>
	<a href="#">TERMOS DE USO</a>
	<span> | </span>
	<g:link url="http://fazrico.wordpress.com" target="blank">BLOG</g:link>
	<span> | </span>
	<a href="#">CONTATO</a>
	
	<%--		<img src="${resource(dir:'images',file:'facebook-icon.png')}"/>--%>
			
	<%--		<img src="${resource(dir:'images',file:'twitter-icon.png')}"/>--%>
</g:else>