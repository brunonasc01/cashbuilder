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

					<div id="field">
						<div class="form-label span-4">
							<label for="email"><g:message code="usuario.email.label" default="Email" /></label>
						</div>			              
						<div class="form-input span-4">
							<g:textField name="email" value="${usuarioInstance?.email}" />
						</div>
						<div class="form-msg span-8 last">
							
						</div>
					</div>
					
					<div class="clear"></div>
		            		
		            <div id="field">	            
			            <div class="form-label span-4">
							<label class="error_label" for="emailRepeat"><g:message code="usuario.emailRepeat.label" default="Confime o Email" /></label>
						</div>			              
						<div class="form-input span-4">
							<g:textField name="emailRepeat" value="${usuarioInstance?.emailRepeat}" />
						</div>
						<div class="form-msg span-8 last">

						</div>
					</div>

					<div class="clear"></div>

					<div id="field">
						<div class="form-label span-4">
							<label for="nome"><g:message code="usuario.nome.label" default="Nome" /></label>
						</div>			              
						<div class="form-input span-4">
							<g:textField name="nome" maxlength="20" value="${usuarioInstance?.nome}" />
						</div>
						<div class="form-msg span-8 last">
							
						</div>
					</div>
					
					<div class="clear"></div>
					
					<div id="field">
						<div class="form-label span-4">
							<label for="password"><g:message code="usuario.password.label" default="Senha" /></label>
						</div>			              
						<div class="form-input span-4">
							<g:passwordField name="password" maxlength="20" value="${usuarioInstance?.password}" />
						</div>
						<div class="form-msg span-8 last">
							
						</div>
					</div>
					
					<div class="clear"></div>
					
					<div id="field">
						<div class="form-label span-4">
							<label for="passwordRepeat"><g:message code="usuario.passwordRepeat.label" default="Confirme a Senha" /></label>
						</div>			              
						<div class="form-input span-4">
							<g:passwordField name="passwordRepeat" maxlength="20" value="${usuarioInstance?.passwordRepeat}" />
						</div>
						<div class="form-msg span-8 last">
							
						</div>
					</div>
					
					<div class="clear"></div>
					
					<div id="submitField">
						<div class="span-3 prepend-4">
							<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
						</div>
						<div class="span-9 alert-msg last">
						</div>
					</div>
            </g:form>
	  	</div>
	</body>		
</html>
