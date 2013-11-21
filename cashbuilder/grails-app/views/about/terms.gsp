<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta name="layout" content="common" />
    <meta name="description" content="${g.message(code:"app.terms.description") }"/>
    <r:require modules="portal"/>
</head>

<body>
	<g:render template="/elements/area_title" model="[bundle_key: 'terms.header.title']"/>

	<div class="col-1">
		<div class="box">
			<div class="content text-box">
				<g:message code="terms.text"/>
			</div>
		</div>
	</div>
</body>		
</html>
