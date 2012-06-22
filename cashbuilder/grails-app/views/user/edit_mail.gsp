<%@ page import="com.cashbuilder.Usuario" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <meta name="layout" content="base" />
    </head>
    
    <body>
    	<div class="span-24">
			<div id="title">
    			<h3>Cadastro</h3>
    		</div>
    	</div>
    
    	<div class="span-20 prepend-2 append-2">
		  	<div id="obox">
				<g:form class="newUser" name="editMail" action="updateMail" >
					<div class="title">
						Atualizacao de e-mail
					</div>

					<div class="inside">
						<div class="inside">
						<g:if test="${flash.message}">
							<div class="form-errors">
								<ul>
									<li><g:message code="${flash.message}"/></li>
								</ul>
							</div>
						</g:if>
				  		<g:else>					
							<g:hasErrors bean="${user}">
				            	<div class="form-errors">
				                	<g:renderErrors bean="${user}" as="list" />
				            	</div>
				            </g:hasErrors>
			            </g:else>
			            
			            <div class="clear"></div>

						<small><g:message code="form.compulsory.message" /></small>
					
						<g:hiddenField name="id" value="${user?.id }" />

						<ul id="field">
							<li class="label">
								<g:message code="edit.email.label" default="Email" />*
							</li>
							<li class="input">
								<g:textField name="email" value="" />
							</li>
						</ul>

						<hr />

						<ul id="field">
							<li class="label">
								<g:message code="emailNovo.label" default="Novo Email" />*
							</li>
							<li class="input">
								<g:textField name="emailNew" value="" />
							</li>
							
							<li class="label">
								<g:message code="emailRepeat.label" default="Repita Email" />*
							</li>
							<li class="input">
								<g:textField name="emailRepeat" value="" />
							</li>
						</ul>
	
						<hr />

						<p class="policy-message"></p>

						<ul id="submitField">
							<li class="button">
								<g:submitButton name="create" class="save" value="Atualizar" />
							</li>
						</ul>
	
						<div class="clear"></div>
	            	</div>
	            </g:form>
		  	</div>
	  	</div>
	  	<div class="clear"></div>
	</body>		
</html>
