<%@ page import="com.cashbuilder.Usuario" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <title>Sistema Grails</title>
        <meta name="layout" content="base" />
        
        <g:javascript>
		$(document).ready(function() {
			ajaxValidate("/cashbuilder/usuario/validator","userForm",false);
		});
		</g:javascript>
    </head>
    
    <body>
	  	<div class="span-18 append-4">
	  		<g:if test="${flash.message}">
				<div class="notice">
					${flash.message}
				</div>
			</g:if>
	  		<g:else>
	            <g:hasErrors bean="${usuarioInstance}">
	            	<div class="error">
	                	<g:renderErrors bean="${usuarioInstance}" as="list" />
	            	</div>
	            </g:hasErrors>
			</g:else>
			
            <g:form name="userForm" action="grava_usuario" >
            	<p class="title">Registro de Usuario</p>

					<fv:textInput name="email" value="${usuarioInstance?.email}" />

					<fv:textInput name="emailRepeat" value="${usuarioInstance?.emailRepeat}" />

					<fv:textInput name="nome" value="${usuarioInstance?.nome}" />
		            
		            <fv:passwordInput name="password" value="${usuarioInstance?.password}" />
									
					<fv:passwordInput name="passwordRepeat" value="${usuarioInstance?.passwordRepeat}" />									

					<fv:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            </g:form>
	  	</div>
	</body>		
</html>
