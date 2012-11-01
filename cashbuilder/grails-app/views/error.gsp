<!doctype html>
<html>
	<head>
		<meta name="layout" content="base" />
        <r:require modules="core"/>
	</head>
	<body>
		<div id="obox">
			<div class="inside text-area">
				<h2 class="negative"><g:message code="app.error.title"/> </h2>
				
				<hr />
				
				<p>				
				<g:message code="app.error.message"/>
				</p>
			</div>
		</div>
<%--		<g:renderException exception="${exception}" />--%>
	</body>
</html>