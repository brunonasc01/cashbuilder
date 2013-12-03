<!DOCTYPE html>
<html lang="pt-BR">

<head>
	<g:set var="wrapper_class" value="wrapper-50" scope="request"></g:set>
    <meta name="layout" content="base" />
    <r:require modules="adm"/>
</head>

<body>
	<g:render template="/elements/area_title" model="[bundle_key: 'manager.user.update.data.label']"/>

	<g:render template="/elements/message"></g:render>

	<div class="col-1">
		<div class="box">
			<div class="content">
				<g:form name="editUser" action="update" controller="user" >
					<g:hiddenField name="full_scr" value="true"></g:hiddenField>

					<label><g:message code="firstName.label" />
					</label><g:textField name="firstName" value="${user?.firstName}"/>
					<label><g:message code="lastName.label" />
					</label><g:textField name="lastName" value="${user?.lastName}"/>
					<label><g:message code="profile.state.label"/>
					</label><input type="text" name="state" id="state" value="${user?.profile?.state}" />
					<label><g:message code="profile.city.label"/>
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