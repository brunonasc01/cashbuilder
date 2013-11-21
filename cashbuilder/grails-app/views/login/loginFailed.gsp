<!DOCTYPE html>
<html lang="pt-BR">
    <head>
    	<g:set var="wrapper_class" value="wrapper-50" scope="request"></g:set>
        <meta name="layout" content="common" />
        <r:require modules="portal"/>
    </head>

    <body>
    	<g:render template="/elements/area_title" model="[bundle_key: 'loginfailed.header.title']"/>

		<div class="col-50">
			<div class="box">
				<div class="content">
					<p><g:message code="form.loginfailed.message.error"/></p>
					<hr />
					<g:form action="login" method="post">
						<label><g:message code="form.label.email"/>
						</label><g:textField name="email" />
						<label><g:message code="form.label.password"/>
						</label><g:passwordField name="password" />
						<div class="content-center">
							<g:submitButton name="login" class="btn" value="Entrar" />
						</div>
					</g:form>
					<hr />
					<p><g:message code="form.loginfalied.message.recover"/></p>
				</div>
			</div>
		</div>

		<div class="col-50">
			<div class="box">
				<div class="content">
					<p><g:message code="form.loginfalied.message.register"/></p>
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
