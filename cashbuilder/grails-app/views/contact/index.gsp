<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta name="layout" content="base" />
        <r:require modules="core"/>
    </head>

    <body>
		<div class="span-18 prepend-3 append-3">
		  	<div id="obox">
				<g:form class="newUser" name="contact" action="submitContact" >
					<div class="title">
						<g:message code="form.contact.title"/>
					</div>
				
					<div class="inside">
						<g:if test="${flash.message}">
							<div class="form-errors">
								<ul>
									<li><g:message code="${flash.message}"/></li>
								</ul>
							</div>
						</g:if>
				  		<g:else>					
							<g:hasErrors bean="${contact}">
				            	<div class="form-errors">
				                	<g:renderErrors bean="${contact}" as="list" />
				            	</div>
				            </g:hasErrors>
			            </g:else>
					
						<div class="clear"></div>
			
						<small><g:message code="form.compulsory.message" /></small>
					
						<p><g:message code="form.contact.message"/></p>
						
						<br/>		

						<ul>
							<fe:element name="name" bean="${contact}" compulsory="*"/>
						</ul>
						
						<hr />
						
						<ul>
							<fe:element name="email" bean="${contact}" compulsory="*"/>
						</ul>
						
						<hr />
						
						<ul>
							<li class="label ${hasErrors(bean: contact, field: 'subject', 'label-error')}">
								<g:message code="form.contact.subject.label"/>*
							</li>
							<li class="input ${hasErrors(bean: contact, field: 'subject', 'input-error')}">			
								<g:select name="subject" from="${subjects }" optionKey="id" optionValue="value"
									noSelection="['': 'Selecione']" value="${contact?.subject }"/>
							</li>
						</ul>

						<hr />
						
						<ul>
							<li class="label ${hasErrors(bean: contact, field: 'message', 'label-error')}">
								<g:message code="form.contact.message.label"/>*
							</li>
							<li class="input ${hasErrors(bean: contact, field: 'message', 'input-error')}">			
								<g:textArea name="message" cols="50" rows="10" maxlength="500" value="${contact.message }"></g:textArea>
							</li>
						</ul>
		
						<hr class="space"/>
	
						<ul class="submit">
							<li class="button">
								<g:submitButton name="Enviar" />
							</li>
						</ul>

						<div class="clear"></div>
	            	</div>
	            </g:form>
		  	</div>
		  	<div class="clear"></div>
	  	</div>
	  	<div class="clear"></div>
	</body>		
</html>
