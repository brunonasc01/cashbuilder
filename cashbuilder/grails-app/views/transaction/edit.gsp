<!DOCTYPE html>
<html lang="pt-BR">

<head>
	<g:set var="wrapper_class" value="wrapper-50" scope="request"></g:set>
    <meta name="layout" content="base" />
    <r:require modules="cashflow"/>
    
    <g:categoriesCombo category="categoryCombo" subcategory="subcategoriesCombo"/>
</head>

<body>

	<div id="month-title" class="col-1">
		<h2 class="title-box">
			<g:message code="box.transaction.edit.title"/>
		</h2>
	</div>
	
	<g:render template="/elements/message"></g:render>
	
	<div class="col-1">
		<div class="box">
			<div class="content">
				<g:form controller="transaction" action="update">
					<g:hiddenField name="id" value="${transaction?.id}" />
					<g:hiddenField name="monthId" value="${monthId }"></g:hiddenField>
					<g:hiddenField name="full_scr" value="true"></g:hiddenField>
			
					<label for="data"><g:message code="box.transaction.date.label"/>
					</label><g:jqDatePicker name="date" value="${transaction?.date }"/>
					
					<label for="valor"><g:message code="box.transaction.value.label"/>
					</label><g:textField maxlength="10" name="value" value="${df.format(transaction?.value)}" />
								
					<label for="categoria"><g:message code="box.transaction.category.label"/>
					</label><g:if test="${categoriesList}">
								 <g:comboBox id="categoryCombo" name="category.id"
									from="${categoriesList.categories}" nameDisplayPrefix="label" 
									optionKey="id" value="${transaction?.category.id}"/>
							</g:if>
							
					<label for="subCategoria"><g:message code="box.transaction.subcategory.label"/>
					</label><g:if test="${categoriesList}">
								<span id="subcategoriesCombo">
								 <g:comboBox name="subcategory.id" from="${subcategoriesList}" nameDisplayPrefix="label"
									optionKey="id" value="${transaction?.subcategory.id}" />
								</span>
							</g:if>
								
					<label for="descricao"><g:message code="box.transaction.description.label"/>
					</label><g:textField name="description" maxlength="100" size="64" value="${transaction?.description }"></g:textField>
		
					<div class="content-center">
							<g:submitButton name="gravar" class="btn" value="Atualizar" />
					</div>
				</g:form>
			</div>
		</div>
	</div>
	
</body>

</html>
