<html>
    <head>
        <title>Sistema Grails</title>
        <meta name="layout" content="base" />
    </head>

    <body>
		<div class="span-8">
			<g:if test="${flash.message}">
				<div class="error">
					${flash.message}
				</div>
			</g:if>

			<g:form action="valida_login" controller="administracao">
				<fieldset>
		            <legend>Login no Sistema</legend>
	
					<div class="form-label span-2">
						<label for="email"><g:message code="usuario.email.label" default="Email" /></label>
					</div>			              
					<div class="span-4 last">
						<g:textField name="email" value="" />
					</div>
	
					<div class="form-label span-2">
						<label for="password"><g:message code="usuario.password.label" default="Senha" /></label>
					</div>			              
					<div class="span-4 last">
						<g:passwordField name="password" maxlength="20" value="" />
					</div>
					
					<div class="span-4 prepend-2">
						<g:submitButton name="login" value="Login" />
					</div>
	         	</fieldset>
			</g:form>
		</div>
	</body>		
</html>
