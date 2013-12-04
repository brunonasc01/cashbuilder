<!DOCTYPE html>
<html lang="pt-BR">

<head>
	<g:set var="wrapper_class" value="wrapper-50" scope="request"></g:set>
    <meta name="layout" content="base" />
    <r:require modules="adm"/>
</head>

<body>
	<g:render template="/elements/area_title" model="[bundle_key: 'form.edituser.data.title']"/>

	<g:render template="/elements/message"></g:render>

	<div class="col-1">
		<div class="box">
			<div class="content">
				<g:form name="editUser" action="update" controller="user" >
					<g:hiddenField name="full_scr" value="true"></g:hiddenField>

					<label><g:message code="form.signup.label.firstName" />
					</label><g:textField name="firstName" value="${user?.firstName}"/>
					<label><g:message code="form.signup.label.lastName" />
					</label><g:textField name="lastName" value="${user?.lastName}"/>
					<label><g:message code="form.signup.label.state"/>
					</label><input type="text" name="state" id="state" value="${user?.profile?.state}" />
					<label><g:message code="form.signup.label.city"/>
					</label><input type="text" name="city" id="city" value="${user?.profile?.city}" />

					<div class="content-center">
						<input type="submit" class="btn" id="submit" value="Gravar"/>
					</div>
				</g:form>
			</div>
		</div>
	</div>
</body>
</html>