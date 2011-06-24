<%@ page import="com.cashbuilder.Usuario" %>

<html>
    <head>
        <title>Sistema Grails</title>
        <meta name="layout" content="base" />
        
        <script>
	  	$(function(){
			$("form").form();
		});
		</script>
    </head>
    
    <body>
	  	<div class="span-12 append-10">
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
			
            <g:form action="save_reg" >
            	<fieldset>
		            <legend>Registro de Usuario</legend>

					<div class="form-label span-4">
						<label for="email"><g:message code="usuario.email.label" default="Email" /></label>
					</div>			              
					<div class="span-6 last">
						<g:textField name="email" value="${usuarioInstance?.email}" />
					</div>
					
					<div class="clear"></div>
		            			            
		            <div class="form-label span-4">
						<label for="emailRepeat"><g:message code="usuario.emailRepeat.label" default="Confime o Email" /></label>
					</div>			              
					<div class="span-6 last">
						<g:textField name="emailRepeat" value="${usuarioInstance?.emailRepeat}" />
					</div>

					<div class="clear"></div>

					<div class="form-label span-4">
						<label for="nome"><g:message code="usuario.nome.label" default="Nome" /></label>
					</div>			              
					<div class="span-6 last">
						<g:textField name="nome" maxlength="20" value="${usuarioInstance?.nome}" />
					</div>
					
					<div class="clear"></div>
					
					<div class="form-label span-4">
						<label for="password"><g:message code="usuario.password.label" default="Senha" /></label>
					</div>			              
					<div class="span-6 last">
						<g:passwordField name="password" maxlength="20" value="${usuarioInstance?.password}" />
					</div>
					
					<div class="clear"></div>
					
					<div class="form-label span-4">
						<label for="passwordRepeat"><g:message code="usuario.passwordRepeat.label" default="Confirme a Senha" /></label>
					</div>			              
					<div class="span-6 last">
						<g:passwordField name="passwordRepeat" maxlength="20" value="${usuarioInstance?.passwordRepeat}" />
					</div>
					
					<div class="clear"></div>
					
					<div class="span-8 prepend-4 last">
						<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					</div>
          		</fieldset>
            </g:form>
	  	</div>
	</body>		
</html>
