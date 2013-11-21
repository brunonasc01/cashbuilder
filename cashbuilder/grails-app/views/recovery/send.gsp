<!DOCTYPE html>
<html lang="pt-BR">
    <head>
    	<g:set var="wrapper_class" value="wrapper-50" scope="request"></g:set>
        <meta name="layout" content="common" />
        <r:require modules="portal"/>
    </head>

    <body>
    	<g:render template="/elements/area_title" model="[bundle_key: 'form.lostpassword.title']"/>

    	<g:render template="/elements/message"></g:render>
    
		<div class="text-center append-bottom-dist">
  			<g:link uri="/" class="btn btn-large append-top-dist">
				<g:message code="form.label.back"/>
			</g:link>
	  	</div>
	</body>		
</html>
