<!DOCTYPE html>
<html lang="pt-BR">
    <head>
    	<g:set var="wrapper_class" value="wrapper-100" scope="request"></g:set>
        <meta name="layout" content="base" />
        <meta name="description" content="${g.message(code:"app.contact.description") }"/>
        <r:require modules="portal"/>
    </head>

    <body>
    	<g:render template="/elements/area_title" model="[bundle_key: 'form.contact.title']"/>
    	<g:render template="/elements/message" var="bean" bean="${contact}"></g:render>

		<div class="col-66 single">
		  	<div class="box">
		  		<div class="content">
		  			<p><g:message code="form.contact.message"/></p>
		  			<hr />

					<g:form class="text-large" name="contact" action="submit" >

					<label><g:message code="form.contact.label.message" />
		    		</label><g:textArea name="message" cols="50" rows="5" maxlength="750" value="${contact.message }"></g:textArea>
					
					<div class="content-center">
						<input type="submit" class="btn" id="submit" value="Enviar"/>
					</div>
					</g:form>
	            </div>
	            
	            <!--<g:render template="/elements/box_breadcrumb" model="[type: 'footer']"></g:render>-->
		  	</div>
	  	</div>
	</body>		
</html>
