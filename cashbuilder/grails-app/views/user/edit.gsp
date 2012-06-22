<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <meta name="layout" content="base" />

		<g:dgCidadesEstados estado="state" estado_valor="${user?.profile?.state}" 
			cidade="city" cidade_valor="${user?.profile?.city}" />
		
    </head>
    
    <body>
    	<div class="span-24">
			<div id="title">
    			<h3>Cadastro</h3>
    		</div>
    	</div>
    
    	<div class="span-20 prepend-2 append-2">
		  	<div id="obox">
				<g:form class="newUser" name="editUser" action="update" >
					<div class="title">
						Atualizacao de dados pessoais
					</div>	
	
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
							<li class="label ${hasErrors(bean: user, field: 'firstName', 'label-error')}">
								<g:message code="firstName.label" default="Primeiro Nome" />*
							</li>
							<li class="input ${hasErrors(bean: user, field: 'firstName', 'input-error')}">								
								<g:textField name="firstName" value="${user?.firstName}" />
							</li>
							
							<li class="label">								
								<g:message code="lastName.label" default="Ultimo Nome" />*
							</li>
							<li class="input">								
								<g:textField name="lastName" value="${user?.lastName}" />
							</li>
						</ul>
	
						<hr />

						<ul id="field">
							<li class="label">
								<g:message code="profile.state.label" default="Estado" />
							</li>
							<li class="input">
								<input type="text" name="profile.state" id="state" value="${user?.profile?.state}" />
							</li>
							
							<li class="label">
								<g:message code="profile.city.label" default="Cidade" />
							</li>
							<li class="input">
								<input type="text" name="profile.city" id="city" value="${user?.profile?.city}" />
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
