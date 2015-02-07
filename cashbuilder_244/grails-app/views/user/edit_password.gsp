<!DOCTYPE html>
<html lang="pt-BR">

<head>
	<g:set var="wrapper_class" value="wrapper-50" scope="request"></g:set>
    <meta name="layout" content="base" />
    <r:require modules="adm"/>
</head>

<body>
	<g:render template="/elements/area_title" model="[bundle_key: 'form.edituser.password.label']"/>

	<g:render template="/elements/message"></g:render>

	<div class="col-1">
		<div class="box">
			<div class="content">
				<g:form name="editPassword" action="updatePassword" controller="user" >
					<g:hiddenField name="full_scr" value="true"></g:hiddenField>

					<label><g:message code="form.edituser.label.password" />
					</label><g:passwordField name="password" value=""/>
					<hr />

					<label><g:message code="form.edituser.label.passwordNew" />
					</label><g:passwordField name="passwordNew" value=""/>
					<label><g:message code="form.edituser.label.passwordRepeat" />
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