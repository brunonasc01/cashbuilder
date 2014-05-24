<!DOCTYPE html>
<html lang="pt-BR">
    
<head>
	<g:set var="wrapper_class" value="wrapper-100" scope="request"></g:set>
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