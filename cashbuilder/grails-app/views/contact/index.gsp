<!DOCTYPE html>
<html lang="pt-BR">
    <head>
    	<g:set var="wrapper_class" value="wrapper-50" scope="request"></g:set>
        <meta name="layout" content="common" />
        <meta name="description" content="${g.message(code:"app.contact.description") }"/>
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

					<g:form class="text-large" name="contact" action="submit" >
					<g:if test="${!userLogged}">
						<label><g:message code="form.label.name" />
			    		</label><g:textField name="name" value="${contact?.name}"/>			    		
			    		<label><g:message code="form.label.email" />
			    		</label><g:textField name="email" value="${contact?.email}"/>
		    		</g:if>
		    		
		    		<label><g:message code="form.contact.label.subject" />
		    		</label><g:select name="subject" from="${subjects}" optionKey="id" optionValue="value"
								noSelection="['': 'Selecione']" value="${contact?.subject }"/>
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
