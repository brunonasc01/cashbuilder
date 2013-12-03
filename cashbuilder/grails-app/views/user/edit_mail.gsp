<!DOCTYPE html>
<html lang="pt-BR">

<head>
	<g:set var="wrapper_class" value="wrapper-50" scope="request"></g:set>
    <meta name="layout" content="base" />
    <r:require modules="adm"/>
</head>

<body>

	<g:render template="/elements/area_title" model="[bundle_key: 'manager.user.update.mail.label']"/>

	<g:render template="/elements/message"></g:render>

	<div class="col-1">
		<div class="box">
			<div class="content">
				<g:form name="editMail" action="updateMail" controller="user" >
					<g:hiddenField name="full_scr" value="true"></g:hiddenField>
				
					<label><g:message code="edit.email.label" />
					</label><g:textField name="email" value=""/>
					<hr/>

					<label><g:message code="emailNew.label" />
					</label><g:textField name="emailNew" value=""/>
					<label><g:message code="emailRepeat.label" />
					</label><g:textField name="emailRepeat" value=""/>

					<div class="content-center">
						<input type="submit" class="btn" id="submit" value="Gravar"/>
					</div>
				</g:form>
			</div>
		</div>
	</div>
</body>
</html>