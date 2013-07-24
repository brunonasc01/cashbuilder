<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta name="layout" content="base_50" />
        <r:require modules="portal"/>
    </head>

    <body>
    	<g:render template="/elements/area_title" model="[bundle_key: 'login.failed.title']"/>

		<div class="col-50">
			<div class="box">
				<div class="content">
					<p><g:message code="login.failed.message1"/></p>
					
					<hr />
					
					<g:form action="login" method="post">
					
						<label><g:message code="default.email.label"/>
						</label><g:textField name="email" />
						
						<label><g:message code="default.password.label"/>
						</label><g:passwordField name="password" />
																				
						<div class="content-center">
							<g:submitButton name="login" class="btn" value="Entrar" />
						</div>
					</g:form>
					
					<hr />
					
					<p><g:message code="login.falied.message2"/></p>
				</div>
			</div>
		</div>
			
		<div class="col-50">
			<div class="box">
				<div class="content">
					<p><g:message code="login.falied.message3"/></p>
					
					<g:form controller="user" action="signup" method="post" >
						<div class="content-center">
							<g:submitButton name="login" class="btn" value="Novo Cadastro" />
						</div>
					</g:form>
				</div>
			</div>
		</div>
	</body>		
</html>
