<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <title>Sistema Grails</title>
        <meta name="layout" content="base" />
        
        <g:javascript>
		$(document).ready(function() {
			ajaxValidate("/cashbuilder/administracao/validator","loginForm",true);
		});
		</g:javascript>
    </head>

    <body>
		<div class="span-15">
			<div id="obox">			
				<g:form class="loginForm" name="loginForm" action="valida_login" controller="administracao">
					<div class="title">
						Login no Sistema
					</div>
		
					<g:if test="${flash.message}">
						<div class="error">
							${flash.message}
						</div>
					</g:if>
			
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
								<g:message code="password.label" default=Senha" />
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
	</body>		
</html>
