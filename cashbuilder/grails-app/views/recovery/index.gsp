
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <meta name="layout" content="base" />
        <r:require modules="info"/>
    </head>

    <body>
		<div class="span-18 prepend-3 append-3">
		  	<div id="obox">
				<g:form class="newUser" name="lostpassword" action="send" >
					<div class="title">
						<g:message code="form.lostpassword.title"/>
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
					
						<p><g:message code="form.lostpassword.message"/></p>					

						<h3><g:message code="form.lostpassword.email.title"/></h3>

						<ul>
							<li class="label">
								<g:message code="default.email.label"/>
							</li>
							<li class="input">			
								<g:textField name="email" />
							</li>
						</ul>

						<hr />

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
