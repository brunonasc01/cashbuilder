<!DOCTYPE html>
<html lang="pt-BR">

<head>
	<g:set var="wrapper_class" value="wrapper-50" scope="request"></g:set>
    <meta name="layout" content="base" />
    <r:require modules="budget"/>
</head>

<body>
	<g:render template="/elements/area_title" model="[bundle_key:'form.budgetitem.title']"/>

	<g:render template="/elements/message"></g:render>

	<div class="col-1">
		<div class="box">
			<div class="content">
				<h4><g:customLabel value="${bean.subcategory}" prefix="label"/></h4>
		
				<g:form action="update" controller="budgetItem">
					<g:hiddenField name="id" value="${bean.id}"/>
					<g:hiddenField name="monthId" value="${monthId}"/>
					<label><g:message code="form.budgetitem.label.currentValue"/></label>
					<g:textField maxlength="10" name="oldValue" value="${bean.budgetedValue}" disabled="true"/>
					<label><g:message code="form.budgetitem.label.newValue"/></label>
					<g:textField maxlength="10" name="budgetedValue" value="" />
					<div class="content-center">
						<input type="submit" class="btn" id="submit" value="Gravar"/>
					</div>
				</g:form>
			</div>
		</div>
	</div>
</body>
</html>