
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <meta name="layout" content="base" />
        <r:require modules="info"/>
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
							
							 <div class="clear"></div>
						</g:if>
					
						<div class="clear"></div>
			
						<small><g:message code="form.compulsory.message" /></small>
					
						<p><g:message code="form.contact.message"/></p>
						
						<br/>		

						<ul>
							<li class="label">
								<g:message code="default.name.label"/>*
							</li>
							<li class="input">			
								<g:textField name="name" />
							</li>
						</ul>
						
						<hr />
						
						<ul>
							<li class="label">
								<g:message code="default.email.label"/>*
							</li>
							<li class="input">			
								<g:textField name="email" />
							</li>
						</ul>
						
						<hr />
						
						<ul>
							<li class="label">
								<g:message code="form.contact.subject.label"/>*
							</li>
							<li class="input">			
								<g:select name="subject" from="${subjects }" optionKey="id" optionValue="value"/>
							</li>
						</ul>

						<hr />
						
						<ul>
							<li class="label">
								<g:message code="form.contact.message.label"/>*
							</li>
							<li class="input">			
								<g:textArea name="message" cols="50" rows="10" maxlength="500"></g:textArea>
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
