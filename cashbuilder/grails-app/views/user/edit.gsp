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
			<g:message code="manager.user.update.data.label"/>
		</h2>
	</div>

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
					</label><input type="text" name="profile.state" id="state" value="${user?.profile?.state}" />
		
					<label><g:message code="profile.city.label"/>
					</label><input type="text" name="profile.city" id="city" value="${user?.profile?.city}" />
		
					<div class="content-center">
						<input type="submit" class="btn" id="submit" value="Gravar"/>
					</div>
				</g:form>
			</div>
		</div>
	</div>

</body>

</html>