<!DOCTYPE html>
<html lang="pt-BR">
    <head>
    	<g:set var="wrapper_class" value="wrapper-50" scope="request"></g:set>
        <meta name="layout" content="common" />
        <meta name="description" content="${g.message(code:"app.contact.description") }"/>
        <r:require modules="portal"/>
    </head>

    <body>
    	<g:render template="/elements/message" var="bean" bean="${contact}"></g:render>

		<div class="col-1">
		  	<div class="font-1_3">
		  		<h2 class="single-title"><g:message code="form.contact.title"/></h2>
		  			  		
	  			<p class="font-1_1"><g:message code="form.contact.message"/></p>
	  			<hr />

				<g:form class="text-large common-form" name="contact" action="submit" >
				
				<label><g:message code="form.label.name" />
	    		</label><g:textField name="name" value="${contact?.name}"/>			    		
	    		<label><g:message code="form.label.email" />
	    		</label><g:textField name="email" value="${contact?.email}"/>

				<label><g:message code="form.contact.label.message" />
	    		</label><g:textArea name="message" cols="50" rows="5" maxlength="750" value="${contact.message }"></g:textArea>
				
				<div class="content-center">
					<input type="submit" class="btn" id="submit" value="Enviar"/>
				</div>
				</g:form>
		  	</div>
	  	</div>
	</body>		
</html>
