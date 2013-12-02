<!DOCTYPE html>
<html lang="pt-BR">
    
<head>
	<g:set var="wrapper_class" value="wrapper-50" scope="request"></g:set>
	<meta name="layout" content="common" />
	<meta name="description" content="${g.message(code:"app.signup.description") }"/>        
	<r:require modules="portal,recaptcha"/>
</head>
    
<body>
	<div id="month-title" class="col-1">
		<h2 class="title-box"><g:message code="form.signup.title"/></h2>
	</div>

	<g:render template="/elements/message" var="bean" bean="${userInstance}" ></g:render>

	<div class="col-1">
		<div class="box">
			<div class="content">
		    	<g:form method="post" action="save" class="text-large">
			    	<label><g:message code="form.signup.label.firstName" />
			    	</label><g:textField name="firstName" value="${userInstance?.firstName}"/>
					<label><g:message code="form.signup.label.lastName" />
			    	</label><g:textField name="lastName" value="${userInstance?.lastName}"/>
					<label><g:message code="form.signup.label.email" />
			    	</label><g:textField name="email" value="${userInstance?.email}"/>
					<label><g:message code="form.signup.label.emailRepeat" />
			    	</label><g:textField name="emailRepeat" value="${userInstance?.emailRepeat}"/>
					<label><g:message code="form.signup.label.password" />
			    	</label><g:passwordField name="password"/>
					<label><g:message code="form.signup.label.passwordRepeat" />
			    	</label><g:passwordField name="passwordRepeat"/>
					<label><g:message code="form.signup.label.state"/>
					</label><g:textField name="state" value="${userInstance?.state}"/>
					<label><g:message code="form.signup.label.city"/>
					</label><g:textField name="city" value="${userInstance?.city}"/>
					<label><g:message code="form.signup.captcha.title"/></label>
					<recaptcha:ifEnabled>
					    <recaptcha:recaptcha theme="white"/>
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