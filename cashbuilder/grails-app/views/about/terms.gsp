<!DOCTYPE html>
<html lang="pt-BR">
<head>
	<g:set var="wrapper_class" value="wrapper-100" scope="request"></g:set>
    <meta name="layout" content="common" />
    <meta name="description" content="${g.message(code:"app.terms.description") }"/>
    <r:require modules="portal"/>
</head>

<body>
	<g:render template="/elements/area_title" model="[bundle_key: 'terms.header.title']"/>

	<div class="col-1">
		<div class="text-box">
			<g:message code="terms.text"/>
		</div>
	</div>
</body>		
</html>
