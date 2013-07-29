<!DOCTYPE html>
<html lang="pt-BR">
    
<head>
	<meta name="layout" content="base_50" />        
	<r:require modules="portal,recaptcha"/>
</head>
    
<body>

	<div id="month-title" class="col-1">
		<h2 class="title-box">
			<g:message code="form.signup.title"/>
		</h2>
	</div>

	<g:render template="/elements/message" var="bean" bean="${userInstance}" ></g:render>

	<div class="col-1">
		<div class="box">
			<div class="content">

		    	<g:form method="post" action="save" class="text-large">
		    		
			    	<label for="nome"><g:message code="firstName.label" />
			    	</label><g:textField name="firstName" value="${userInstance?.firstName}"/>
					
					<label for="sobrenome"><g:message code="lastName.label" />
			    	</label><g:textField name="lastName" value="${userInstance?.lastName}"/>
					
					<label for="email"><g:message code="email.label" />
			    	</label><g:textField name="email" value="${userInstance?.email}"/>

					<label for="emailRepeat"><g:message code="emailRepeat.label" />
			    	</label><g:textField name="emailRepeat" value="${userInstance?.emailRepeat}"/>
					
					<label for="password"><g:message code="password.label" />
			    	</label><g:passwordField name="password"/>
					
					<label for="passwordRepeat"><g:message code="passwordRepeat.label" />
			    	</label><g:passwordField name="passwordRepeat"/>

					<label for="state"><g:message code="profile.state.label"/>
					</label><input type="text" name="profile.state" id="state" value="${userInstance?.profile?.state}" />
					
					<label for="city"><g:message code="profile.city.label"/>
					</label><input type="text" name="profile.city" id="state" value="${userInstance?.profile?.city}" />

					<label><g:message code="form.signup.captcha.title"/></label>
					
					<recaptcha:ifEnabled>
					    <recaptcha:recaptcha theme="clean"/>
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
