<!DOCTYPE html>
<html lang="pt-BR">

<head>
	<g:set var="wrapper_class" value="wrapper-50" scope="request"></g:set>
    <meta name="layout" content="base" />
    <r:require modules="cashflow"/>
    
    <g:categoriesCombo category="categoryCombo" subcategory="subcategoriesCombo"/>
</head>

<body>
	<g:render template="/elements/area_title" model="[bundle_key: 'form.transaction.title']"/>
    	
	<g:render template="/elements/message"></g:render>

	<div class="col-1">
		<div class="box">
			<div class="content">
				<g:form controller="transaction" action="save">
					<g:hiddenField name="monthId" value="${monthId }"></g:hiddenField>
					<g:hiddenField name="full_scr" value="true"></g:hiddenField>
			
					<label for="data"><g:message code="form.transaction.label.date"/>
					</label><g:jqDatePicker name="date"/>
					<label for="valor"><g:message code="form.transaction.label.value"/>
					</label><g:textField maxlength="10" name="value" value="" />
					<label for="parcelas"><g:message code="form.transaction.label.parcels" />
					</label><g:select name="parcels" from="${1..24}" optionValue="${{it == 1? "à vista" : it}}"/>
					<label for="categoria"><g:message code="form.label.category"/>
					</label><g:if test="${categoriesList}">
								 <g:comboBox id="categoryCombo" name="category.id"
									from="${categoriesList.categories}" nameDisplayPrefix="label"
									optionKey="id" defaultOption="['': 'Selecione']" />
							</g:if>
					<label for="subCategoria"><g:message code="form.label.subcategory"/>
					</label><g:if test="${categoriesList}">
								<span id="subcategoriesCombo">
								 <g:comboBox name="subcategory.id" from="" nameDisplayPrefix="label"
									defaultOption="['': 'Selecione uma categoria']" />
								</span>
							</g:if>
					<label for="descricao"><g:message code="form.transaction.label.description"/>
					</label><g:textField name="description" maxlength="100" size="64"></g:textField>
		
					<div class="content-center">
						<g:submitButton name="gravar" class="btn" value="Gravar" />
					</div>
				</g:form>
			</div>
		</div>
	</div>
</body>
</html>