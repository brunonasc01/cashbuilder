<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta name="layout" content="base_50" />
        <r:require modules="portal"/>
    </head>

    <body>
    	<g:render template="/elements/area_title" model="[bundle_key: 'form.contact.title']"/>
    
    	<g:render template="/elements/message" var="bean" bean="${contact}"></g:render>

		<div class="col-1">
		  	<div class="box">
		  		<div class="content">
		  			<p><g:message code="form.contact.message"/></p>
		  		
		  			<hr />
		  		
					<g:form class="text-large" name="contact" action="submitContact" >

						<label for="name"><g:message code="name.label" />
			    		</label><g:textField name="name" value="${contact?.name}"/>
			    		
			    		<label for="email"><g:message code="email.label" />
			    		</label><g:textField name="email" value="${contact?.email}"/>
			    		
			    		<label for="subject"><g:message code="form.contact.subject.label" />
			    		</label><g:select name="subject" from="${subjects}" optionKey="id" optionValue="value"
									noSelection="['': 'Selecione']" value="${contact?.subject }"/>

						<label for="messagem"><g:message code="form.contact.message.label" />
			    		</label><g:textArea name="message" cols="50" rows="5" maxlength="750" value="${contact.message }"></g:textArea>
						
						<div class="content-center">
							<input type="submit" class="btn" id="submit" value="Enviar"/>
						</div>
					</g:form>
	            </div>
		  	</div>
	  	</div>
	</body>		
</html>
