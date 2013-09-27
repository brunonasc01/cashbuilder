<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta name="layout" content="common_50" />
        <r:require modules="portal"/>
    </head>

    <body>
    	<g:if test="${!recovery }">
    		<g:render template="/elements/area_title" model="[bundle_key: 'form.lostpassword.title']"/>
    	</g:if>
    	<g:else>
    		<g:render template="/elements/area_title" model="[bundle_key: 'form.resetpassword.title']"/>
    	</g:else>
    
    	<g:render template="/elements/message" var="bean" bean="${bean}"></g:render>
    
		<div class="col-1">
		  	<div class="box">
		  		<div class="content">
			  		<g:if test="${!recovery }">
						<g:form name="lostpassword" action="send" >
							
							<p><g:message code="form.lostpassword.message"/></p>					
	
							<hr />
	
							<label><g:message code="form.lostpassword.email.title"/>
							</label><g:textField name="email" />
	
							<div class="content-center">
								<input type="submit" class="btn" id="submit" value="Enviar"/>
							</div>
			            </g:form>
		            </g:if>
		            <g:else>
		            	<g:form name="resetpassword" action="reset" >
							<g:hiddenField name="token" value="${bean?.token}" />

							<p><g:message code="form.resetpassword.message"/></p>

							<hr />

							<label><g:message code="passwordNew.label"/>
							</label><g:passwordField name="passwordNew" />

							<label><g:message code="passwordRepeat.label"/>
							</label><g:passwordField name="passwordRepeat" />
	
							<small><g:message code="form.password.message"/></small>

							<div class="content-center">
								<input type="submit" class="btn" id="submit" value="Gravar nova Senha"/>
							</div>
			            </g:form>
		            </g:else>
	            </div>
		  	</div>
	  	</div>
	</body>		
</html>
