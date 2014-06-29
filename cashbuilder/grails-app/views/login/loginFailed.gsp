<!DOCTYPE html>
<html lang="pt-BR">
    <head>
    	<g:set var="wrapper_class" value="wrapper-75" scope="request"></g:set>
        <meta name="layout" content="common" />
        <r:require modules="portal"/>
    </head>

    <body>
    	<div class="col-1 font-1_3">
    		<h2 class="single-title"><g:message code="loginfailed.header.title"/></h2>
    	</div>

		<div class="col-50">
			<div class="font-1_3">
				<p class="font-1_1"><g:message code="form.loginfailed.message.error"/></p>
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
				<p class="font-1_1"><g:message code="form.loginfalied.message.recover"/></p>
			</div>
		</div>

		<div class="col-50">
			<div class="font-1_3">
				<p class="font-1_1"><g:message code="form.loginfalied.message.register"/></p>
				<g:form controller="user" action="signup" method="post" >
					<div class="content-center">
						<g:submitButton name="login" class="btn" value="Novo Cadastro" />
					</div>
				</g:form>
			</div>
		</div>
	</body>
</html>
