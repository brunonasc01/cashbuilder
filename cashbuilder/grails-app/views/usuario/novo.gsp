<%@ page import="com.cashbuilder.Usuario" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <title>Sistema Grails</title>
        <meta name="layout" content="base" />
        
        <g:validateForm controller="usuario" form="newUser" />
    </head>
    
    <body>
	  	<div id="obox">
			<g:form class="userForm" name="newUser" action="save" >
				<div class="title">
					Registro de Usuario
				</div>
			
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
							<g:message code="emailRepeat.label" default="Repetir Email" />
						</li>
						<li class="input">
							<g:textField name="emailRepeat" value="${usuarioInstance?.emailRepeat}" />
						</li>
						<li class="message"></li>
					</ul>
				
					<div class="clear"></div>
				
					<ul id="field">
						<li class="label">
							<g:message code="nome.label" default="Nome" />
						</li>
						<li class="input">
							<g:textField name="nome" value="${usuarioInstance?.nome}" />
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

					<ul id="field">
						<li class="label">
							<g:message code="passwordRepeat.label" default="Repetir Senha" />
						</li>
						<li class="input">
							<g:passwordField name="passwordRepeat" value="${usuarioInstance?.passwordRepeat}" />
						</li>
						<li class="message"></li>
					</ul>
		            	           
					<div class="clear"></div>
				
					<ul id="submitField">
						<li class="button">
							<g:submitButton name="create" class="save" value="Gravar" />
						</li>
						<li class="message"></li>
					</ul>

					<div class="clear"></div>
            	</div>
            </g:form>
	  	</div>
	  	<div class="clear"></div>
	</body>		
</html>
