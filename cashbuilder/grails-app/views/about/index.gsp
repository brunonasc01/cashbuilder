<!DOCTYPE html>
<html lang="pt-BR">
    
<head>
	<meta name="layout" content="common" />
	<meta name="description" content="${g.message(code:"app.about.description") }"/>
	<r:require modules="portal"/>
</head>

<body>
	<g:render template="/elements/area_title" model="[bundle_key: 'about.header.title']"/>
	  	
	<div class="col-1">
		<div class="box">
			<div class="content text-box">
				<g:message code="about.text"/>
			</div>
		</div>
	</div>
</body>		
</html>