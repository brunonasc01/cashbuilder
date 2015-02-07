<%@page import="com.cashbuilder.Constants"%>
<!DOCTYPE html>
<html lang="pt-BR">
    
<head>
	<g:set var="wrapper_class" value="wrapper-50" scope="request"></g:set>
	<meta name="layout" content="common" />
	<meta name="description" content="${g.message(code:"app.signup.description") }"/>        
	<asset:stylesheet src="portal.css"/>
	<asset:javascript src="common.js"/>
</head>
    
<body>
	<g:render template="/elements/message" var="bean" bean="${userInstance}" ></g:render>

	<div class="col-1">
		<div class="font-1_3">
			<h2 class="single-title"><g:message code="form.signup.title"/></h2>
		    	<g:form method="post" action="save" class="text-large common-form">
		    		<g:hiddenField name="timestamp" value="${timestamp}"/>
		    	
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
					</label><g:select name="state"  from="${Constants.STATES_LIST}" value="${userInstance?.state}"
								noSelection="[' ': 'Selecione']" valueMessagePrefix="state"/>
					<label><g:message code="form.signup.label.city"/>
					</label><g:textField name="city" value="${userInstance?.city}"/>

					<small><g:message code="form.signup.policy.message"/></small>

					<div class="content-center">
						<input type="submit" class="btn" id="submit" value="Cadastrar"/>
					</div>
		    	</g:form>
		    
		</div>
	</div>    	
</body>		
</html>