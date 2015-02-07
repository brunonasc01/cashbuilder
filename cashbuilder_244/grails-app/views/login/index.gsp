<!DOCTYPE html>
<html lang="pt-BR">
    <head>
    	<g:set var="wrapper_class" value="wrapper-100" scope="request"></g:set>
        <meta name="layout" content="clean" />
        <asset:stylesheet src="login.css"/>
    </head>

    <body>
    	
		<div class="login">
			<div class="text-center">
				<img alt="<g:message code="app.name"/>" src="${resource(dir:'images',file:'logo_small_login.png')}"/>
			</div>
			
			<div class="login-fields">
				<g:form action="login" method="post">
					<label><g:message code="form.label.email"/>
					</label><g:textField name="email" />
					<label><g:message code="form.label.password"/>
					</label><g:passwordField name="password" />
					<div class="content-center">
						<g:submitButton name="login" class="btn btn-medium" value="Entrar" />
					</div>
				</g:form>
	
				<ul class="login-links">
					<li><g:link controller="user" action="signup"><g:message code="form.login.link.signup"/></g:link>
					</li><li><g:link controller="recovery"><g:message code="form.login.link.lostpassword"/></g:link>
				</ul>
			</div>
		</div>
		
	</body>
</html>
