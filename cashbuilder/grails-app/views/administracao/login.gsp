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
		<div class="span-8">
			<g:if test="${flash.message}">
				<div class="error">
					${flash.message}
				</div>
			</g:if>

			<g:form name="loginForm" action="valida_login" controller="administracao">
				<p class="title">Login</p>
	
				<fv:textInputShort name="email" />
				
				<fv:passwordInputShort name="password" maxlength="20" />

				<div id="submitField">
					<div class="span-1 prepend-2">
						<g:submitButton name="login" value="OK" />
					</div>
					<div class="span-4 alert-msg-short last">
						</div>
				</div>
			</g:form>
		</div>
	</body>		
</html>
