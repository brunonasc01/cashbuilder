<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <meta name="layout" content="base" />

		<g:validateForm controller="login" form="loginForm" onTop="true" />
    </head>

    <body>
		<div class="span-12">
			<div id="lbox">			
				<g:form class="loginForm" name="loginForm" action="validate_access">
					<div class="title">
						Acesso ao Cashbuilder
					</div>
		
					<g:if test="${flash.message}">
						<div class="error">
							${flash.message}
						</div>
					</g:if>
					
					<div id="error" class="msg-erro">
						
					</div>

					<div class="inside">
						<ul id="field">
							<li class="label">
								<g:message code="email.label" default="Email" />
							</li>
							<li class="input">
								<g:textField name="email" value="${usuarioInstance?.email}" />
							</li>
							<li class="message"></li>
						</ul>
						
						<div class="clear"></div>
						
						<ul id="field">
							<li class="label">
								<g:message code="password.label" default="Senha" />
							</li>
							<li class="input">
								<g:passwordField name="password" value="${usuarioInstance?.password}" />
							</li>
							<li class="message"></li>
						</ul>

						<div class="clear"></div>

						<ul id="submitField">
							<li class="button">
								<g:submitButton name="login" value="Entrar" />
							</li>
							<li class="message"></li>
						</ul>
						
						<div class="clear"></div>
					</div>
				</g:form>
			</div>
			<div class="clear"></div>
		</div>
		
		<div class="span-12 last">
			<div id="rbox">
				<div class="title">
					Novo Usuario
				</div>
				
				<div class="inside center">
					Faca o registro e de um novo futuro para suas financas
					
					<g:form controller="usuario" action="novo">
						<g:submitButton name="newUser" class="singleButton" value="Cadastrar"/>
					</g:form>
				</div>
			</div>
		</div>
	</body>		
</html>
