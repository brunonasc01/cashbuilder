<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <meta name="layout" content="base" />
		<r:require modules="core"/>

		<g:dgCidadesEstados estado="state" estado_valor="${user?.profile?.state}" 
			cidade="city" cidade_valor="${user?.profile?.city}" />
		
    </head>
    
    <body>
    	<div class="span-24">
    		<g:render template="/elements/area_title" model="[bundle_key: 'manager.user.title.label']"/>
    	</div>
    
    	<div class="span-20 prepend-2 append-2">
		  	<div id="obox">
				<g:form class="newUser" name="editUser" action="update" >
					<div class="title">
						<g:message code="manager.user.update.data.label"/>
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
							<fe:element name="firstName" bean="${user}" compulsory="*"/>
							
							<fe:element name="lastName" bean="${user}" compulsory="*"/>
						</ul>
	
						<hr />

						<ul id="field">
							<li class="label ${hasErrors(bean: user?.profile, field: 'state', 'label-error')}">
								<g:message code="profile.state.label"/>*
							</li>
							<li class="input ${hasErrors(bean: user?.profile, field: 'state', 'input-error')}">
								<input type="text" name="profile.state" id="state" value="${user?.profile?.state}" />
							</li>
							
							<li class="label ${hasErrors(bean: user?.profile, field: 'city', 'label-error')}">
								<g:message code="profile.city.label"/>*
							</li>
							<li class="input ${hasErrors(bean: user?.profile, field: 'city', 'input-error')}">
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
