<!DOCTYPE html>
<html lang="pt-BR">

<head>
	<g:set var="wrapper_class" value="wrapper-50" scope="request"></g:set>
    <meta name="layout" content="base" />
    <r:require modules="adm"/>
</head>

<body>

	<div id="month-title" class="col-1">
		<h2 class="title-box">
			<g:message code="manager.user.update.password.label"/>
		</h2>
	</div>

	<g:render template="/elements/message"></g:render>

	<div class="col-1">
		<div class="box">
			<div class="content">
				<g:form name="editPassword" action="updatePassword" controller="user" >
					<g:hiddenField name="full_scr" value="true"></g:hiddenField>
				
					<label><g:message code="edit.password.label" />
					</label><g:passwordField name="password" value=""/>
					
					<hr />
					
					<label><g:message code="passwordNew.label" />
					</label><g:passwordField name="passwordNew" value=""/>
					
					<label><g:message code="passwordRepeat.label" />
					</label><g:passwordField name="passwordRepeat" value=""/>
					
					<div class="content-center">
						<input type="submit" class="btn" id="submit" value="Gravar"/>
					</div>
				</g:form>
			</div>
		</div>
	</div>
	
</body>

</html>