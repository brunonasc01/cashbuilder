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
			<g:message code="form.manager.category.edit.title"/>
		</h2>
	</div>

	<g:render template="/elements/message"></g:render>

	<div class="col-1">
		<div class="box">
			<div class="content">
				<h4>${category.name }</h4>
			
				<g:form name="editCategory" action="update" controller="category" >
					<g:hiddenField name="full_scr" value="true"></g:hiddenField>
					<g:hiddenField name="id" value="${category.id }"/>
					
					<g:each var="subcategory" in="${category.subcategories}" status="i">
						<label>[${i+1}] <g:message code="form.label.subcategory"/>
						</label><g:textField name="subcategories[${i}].name" value="${subcategory.name}" />
					</g:each>
		
					<div class="content-center">
						<input type="submit" class="btn" id="submit" value="Gravar"/>
					</div>
				</g:form>
			</div>
		</div>
	</div>
</body>
</html>