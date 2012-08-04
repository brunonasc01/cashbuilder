<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <meta name="layout" content="base" />
        <r:require modules="core"/>
    </head>
    
    <body>
    	<div class="span-24">
			<g:render template="/elements/area_title" model="[bundle_key: 'manager.user.title.label']"/>
    	</div>
    
    	<div class="span-20 prepend-2 append-2">
		  	<div id="obox">
				<g:form class="newUser" name="editMail" action="updateMail" >
					<div class="title">
						<g:message code="manager.user.update.mail.label"/>
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

						<ul>
							<li class="label ${hasErrors(bean: user, field: 'email', 'label-error')}">
								<g:message code="edit.email.label"/>*
							</li>
							<li class="input ${hasErrors(bean: user, field: 'email', 'input-error')}">
								<g:textField name="email" />
							</li>
						</ul>

						<hr />

						<ul>
							<li class="label ${hasErrors(bean: user, field: 'emailNew', 'label-error')}">
								<g:message code="emailNew.label"/>*
							</li>
							<li class="input  ${hasErrors(bean: user, field: 'emailNew', 'input-error')}">
								<g:textField name="emailNew" />
							</li>
							
							<li class="label ${hasErrors(bean: user, field: 'emailRepeat', 'label-error')}">
								<g:message code="emailRepeat.label"/>*
							</li>
							<li class="input ${hasErrors(bean: user, field: 'emailRepeat', 'input-error')}">
								<g:textField name="emailRepeat" />
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
