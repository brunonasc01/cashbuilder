<%@ page import="com.cashbuilder.Usuario" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <meta name="layout" content="base" />

        <g:javascript>
		$(document).ready(function() {
			ajaxValidate("/cashbuilder/usuario/emailEditValidator","editMail",true);
		});
		</g:javascript>
    </head>
    
    <body>
    	<div class="span-24">
			<div id="title">
    			<h3>Cadastro</h3>
    		</div>
    	</div>
    
    	<div class="span-24">
		  	<div id="obox">
				<g:form class="userForm" name="editMail" action="updateMail" >
					<div class="title">
						Meus Dados
					</div>
				
					<g:if test="${flash.message}">
						<div class="notice">
							${flash.message}
						</div>
					</g:if>
			  		<g:else>
			            <g:hasErrors bean="${usuario}">
			            	<div class="error">
			                	<g:renderErrors bean="${usuario}" as="list" />
			            	</div>
			            </g:hasErrors>
					</g:else>
	
					<div class="inside">
						<g:hiddenField name="id" value="${usuario?.id }" />

						<ul id="field">
							<li class="label">
								<g:message code="edit.email.label" default=Email" />
							</li>
							<li class="input">
								<g:textField name="email" value="" />
							</li>
							<li class="message"></li>
						</ul>

						<div class="clear"></div> <hr class="space"></hr>

						<ul id="field">
							<li class="label">
								<g:message code="emailNovo.label" default="Novo Email" />
							</li>
							<li class="input">
								<g:textField name="emailNovo" value="" />
							</li>
							<li class="message"></li>
						</ul>
	
						<div class="clear"></div>

						<ul id="field">
							<li class="label">
								<g:message code="emailRepeat.label" default="Repita Email" />
							</li>
							<li class="input">
								<g:textField name="emailRepeat" value="" />
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
	  	</div>
	  	<div class="clear"></div>
	</body>		
</html>
