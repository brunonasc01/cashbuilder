<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <meta name="layout" content="base" />
        <r:require modules="recaptcha"/>
    </head>
    
    <body>
    	<div class="span-20 prepend-2 append-2">
		  	<div id="obox">
				<g:form class="userForm" name="signup" action="save" >
					<div class="title">
						<g:message code="form.signup.title"/>
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
							<g:hasErrors bean="${userInstance}">
				            	<div class="form-errors">
				                	<g:renderErrors bean="${userInstance}" as="list" />
				            	</div>
				            </g:hasErrors>
			            </g:else>
			            
			            <div class="clear"></div>

						<small><g:message code="form.compulsory.message" /></small>					
						
						<div class="clear"></div>
						
						<h3><g:message code="form.signup.usedata.title"/></h3>
					
						<ul id="field">
							<li class="label ${hasErrors(bean: userInstance, field: 'firstName', 'label-error')}">
								<g:message code="firstName.label" default="Primeiro Nome" />*
							</li>
							<li class="input ${hasErrors(bean: userInstance, field: 'firstName', 'input-error')}">								
								<g:textField name="firstName" value="${userInstance?.firstName}" />
							</li>
							
							<li class="label">								
								<g:message code="lastName.label" default="Ultimo Nome" />*
							</li>
							<li class="input">								
								<g:textField name="lastName" value="${userInstance?.lastName}" />
							</li>
						</ul>
	
						<hr />
					
						<ul id="field">
							<li class="label">								
								<g:message code="email.label" default="Seu e-mail" />*
							</li>
							<li class="input">								
								<g:textField name="email" value="${userInstance?.email}" />
							</li>
							
							<li class="label">
								<g:message code="emailRepeat.label" default="Repita o e-mail" />*
							</li>
							<li class="input">								
								<g:textField name="emailRepeat" value="${userInstance?.emailRepeat}" />
							</li>
						</ul>
						
						<hr />
					
						<ul id="field">
							<li class="label">								
								<g:message code="password.label" default="Sua senha" />*
							</li>
							<li class="input">
								<input type="password" name="password" value="${userInstance?.password}" />
							</li>
							
							<li class="label">								
								<g:message code="passwordRepeat.label" default="Repita a senha" />*
							</li>
							<li class="input">
								<input type="password" name="passwordRepeat" value="${userInstance?.passwordRepeat}" />
							</li>
							
							<li class="warn">
								<small><g:message code="form.password.message"/></small>
							</li>
						</ul>
	
						<hr />
					
						<h3><g:message code="form.signup.profiledata.title"/></h3>
					
						<ul id="field">
							<li class="label">
								<g:message code="profile.state.label" default="Estado" />
							</li>
							<li class="input">
								<g:textField name="profile.state" value="${userInstance?.profile?.state}" />
							</li>
							
							<li class="label">
								<g:message code="profile.city.label" default="Cidade" />
							</li>
							<li class="input">
								<g:textField name="profile.city" value="${userInstance?.profile?.city}" />
							</li>
						</ul>

						<hr />

						<g:if test="${expenses }" >
							<g:set var="counter" value="${0}" />
							<ul id="field">
								<li class="label">
									<g:message code="profile.expenses.label" default="Despesas" />
								</li>
								
								<li class="input">						
									<small><g:message code="form.signup.expenses.message"/>:</small>
								
									<ul class="check-options">
										<g:each var="expense" in="${expenses}">
											<li>
												<g:hiddenField name="profile.expenses[${counter}].name" value="${expense }"></g:hiddenField>
												<g:checkBox name="profile.expenses[${counter}].enabled"></g:checkBox>
												${expense }
											</li>
											<g:set var="counter" value="${counter + 1}" />
										</g:each>
									</ul>
								</li>
							</ul>
							
							<hr />
						</g:if>

						<p class="policy-message">
							<g:message code="form.signup.policy.messagem"/>
						</p>
						
						<ul id="submitField">
							<li class="button">
								<input type="submit" name="create" class="save" value="Cadastrar" id="create" />
							</li>
						</ul>
						
						<ul id="recaptcha_widget" style="display:none">
							<li class="label">
								<span class="recaptcha_only_if_image">Digite as palavras</span>
								<span class="recaptcha_only_if_audio">Digite os numeros</span>
							</li>
							<li class="input">
								<div id="recaptcha_image"></div>
								
								<div class="recaptcha_only_if_incorrect_sol" style="color:red">Incorrect please try again</div>
								
								<ul>
									<li class="captcha_text">
										<g:textField name="recaptcha_response_field" />
									</li>
									<li class="captcha_button">
										<div><a href="javascript:Recaptcha.reload()">R</a></div>
									</li>
									<li class="captcha_button">
									   	<div class="recaptcha_only_if_image"><a href="javascript:Recaptcha.switch_type('audio')">A</a></div>
									   	<div class="recaptcha_only_if_audio"><a href="javascript:Recaptcha.switch_type('image')">I</a></div>
									</li>
									<li class="captcha_button">
								   		<div><a href="javascript:Recaptcha.showhelp()">H</a></div>
								   	</li>
							   	</ul>
							</li>
						</ul>
						<recaptcha:ifEnabled>
					       <recaptcha:recaptcha theme="custom" lang="en" custom_theme_widget="recaptcha_widget"/>
					   </recaptcha:ifEnabled>
	
						<div class="clear"></div>
	            	</div>
	            </g:form>
		  	</div>
		  	<div class="clear"></div>
	  	</div>
	  	<div class="clear"></div>
	</body>		
</html>
