
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <meta name="layout" content="base" />
        <r:require modules="info"/>
    </head>

    <body>
		<div class="span-18 prepend-3 append-3">
		  	<div id="obox">
		  		<g:if test="${!recovery }">
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
	            </g:if>
	            <g:else>
	            	<g:form class="newUser" name="resetpassword" action="reset" >
						<div class="title">
							<g:message code="form.resetpassword.title"/>
						</div>
					
						<div class="inside">
							<g:hasErrors bean="${bean}">
				            	<div class="form-errors">
				                	<g:renderErrors bean="${bean}" as="list" />
				            	</div>
				            </g:hasErrors>
						
							<g:hiddenField name="token" value="${bean.token}" />
						
							<small><g:message code="form.compulsory.message" /></small>
							
							<p><g:message code="form.resetpassword.message"/></p>					
	
							<h3><g:message code="form.resetpassword.password.title"/></h3>
	
							<ul>
								<li class="label">
									<g:message code="passwordNew.label"/>*
								</li>
								<li class="input">			
									<g:passwordField name="passwordNew" />
								</li>

								<li class="label">
									<g:message code="passwordRepeat.label"/>*
								</li>
								<li class="input">			
									<g:passwordField name="passwordRepeat" />
								</li>
								
								<li class="warn">
									<small><g:message code="form.password.message"/></small>
								</li>
							</ul>
	
							<hr />
	
							<ul class="submit">
								<li class="button">
									<g:submitButton name="Gravar nova Senha" />
								</li>
							</ul>
	
							<div class="clear"></div>
		            	</div>
		            </g:form>
	            </g:else>
		  	</div>
		  	<div class="clear"></div>
	  	</div>
	  	<div class="clear"></div>
	</body>		
</html>
