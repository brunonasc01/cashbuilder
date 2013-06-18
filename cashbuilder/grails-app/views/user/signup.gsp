<!DOCTYPE html>
<html lang="pt-BR">
    
<head>
	<meta name="layout" content="base_50" />        
	<r:require modules="core,recaptcha"/>
</head>
    
<body>

	<div id="month-title" class="col-1">
		<h2 class="title-box">
			<g:message code="form.signup.title"/>
		</h2>
	</div>

	<g:if test="${flash.message}">
		<div class="col-1">
			<div class="message error">
				<ul>
					<li><g:message code="${flash.message}"/></li>
				</ul>
			</div>
		</div>
	</g:if>
	<g:else>					
	<g:hasErrors bean="${userInstance}">
		<div class="col-1">
			<div class="message error">
				<g:renderErrors bean="${userInstance}" as="list" />
			</div>
		</div>
	</g:hasErrors>
	</g:else>

	<div class="col-1">
		<div class="box">
			<div class="content">

		    	<g:form method="post" action="save" class="text-large">
		    		
			    	<label for="nome"><g:message code="firstName.label" />
			    	</label><g:textField name="firstName"/>
					
					<label for="sobrenome"><g:message code="lastName.label" />
			    	</label><g:textField name="lastName"/>
					
					<label for="email"><g:message code="email.label" />
			    	</label><g:textField name="email"/>

					<label for="emailRepeat"><g:message code="emailRepeat.label" />
			    	</label><g:textField name="emailRepeat"/>
					
					<label for="password"><g:message code="password.label" />
			    	</label><g:passwordField name="password"/>
					
					<label for="passwordRepeat"><g:message code="passwordRepeat.label" />
			    	</label><g:passwordField name="passwordRepeat"/>

					<label for="state"><g:message code="profile.state.label"/>
					</label><input type="text" name="profile.state" id="state" value="${userInstance?.profile?.state}" />
					
					<label for="city"><g:message code="profile.city.label"/>
					</label><input type="text" name="profile.city" id="state" value="${userInstance?.profile?.state}" />

					<label><g:message code="form.signup.captcha.title"/></label>
					
					<div id="recaptcha_widget" style="display:none">
						<div id="recaptcha_image"></div>
						<div class="recaptcha_only_if_incorrect_sol" style="color:red">Incorrect please try again</div>
						
						<span class="recaptcha_only_if_image">Enter the words above:</span>
						<span class="recaptcha_only_if_audio">Enter the numbers you hear:</span>
						
						<input type="text" id="recaptcha_response_field" name="recaptcha_response_field" />
						
						<div><a href="javascript:Recaptcha.reload()">Get another CAPTCHA</a></div>
						<div class="recaptcha_only_if_image"><a href="javascript:Recaptcha.switch_type('audio')">Get an audio CAPTCHA</a></div>
						<div class="recaptcha_only_if_audio"><a href="javascript:Recaptcha.switch_type('image')">Get an image CAPTCHA</a></div>
						
						<div><a href="javascript:Recaptcha.showhelp()">Help</a></div>
					</div>
					
					<recaptcha:ifEnabled>
				       <recaptcha:recaptcha theme="clean" lang="en" custom_theme_widget="recaptcha_widget"/>
					</recaptcha:ifEnabled>

						<small><g:message code="form.signup.policy.message"/></small>
											
					<div class="content-center">
						<input type="submit" class="btn" id="submit" value="Cadastrar"/>
					</div>

		    	</g:form>
		    </div>
		</div>
	</div>    	
</body>		
</html>
