<!DOCTYPE html>
<html lang="pt-BR">

<head>
	<g:set var="wrapper_class" value="wrapper-50" scope="request"></g:set>
    <meta name="layout" content="base" />
    <r:require modules="goal"/>
    
    <g:categoriesCombo category="categoryCombo" subcategory="subcategoriesCombo" action="selectedMultipleCategories" name="subcategories[X].id"  multipleSubs="true"/>
</head>

<body>
	<g:render template="/elements/area_title" model="[bundle_key: 'form.goal.title']"/>

	<g:render template="/elements/message"></g:render>

	<div class="col-1">
		<div class="box">
			<div class="content">
				<g:form controller="goal" action="save">
					<g:hiddenField name="full_scr" value="true"></g:hiddenField>
					<label><g:message code="form.goal.label.title"/>
					</label><g:textField name="title" value="" />
					<label><g:message code="form.goal.label.total"/>
					</label><g:textField maxlength="10" name="total" value="" />
					<label><g:message code="form.goal.label.startdate"/>
					</label><g:jqDatePicker name="startDate"/>
					<label><g:message code="form.goal.label.enddate"/>
					</label><g:jqDatePicker name="endDate"/>
					<label for="categoria"><g:message code="form.goal.label.category"/>
					</label><g:if test="${categoriesList}">
							 <g:comboBox id="categoryCombo" name="select"
								from="${categoriesList.categories}" 
								optionKey="id" nameDisplayPrefix="label" />
						</g:if>

					<g:set var="counter" value="${0}" />
		    		<label for="subCategoria"><g:message code="form.goal.label.subcategory"/>
					</label><g:if test="${categoriesList}">
							<span id="subcategoriesCombo[${counter}]">
							 <g:comboBox name="subcategories[${counter}].id" nameDisplayPrefix="label"
								from="" defaultOption="['': 'Selecione uma categoria']" />
							</span>
						</g:if>
					<div class="content-center">
						<input type="submit" class="btn" id="submit" value="Gravar"/>
					</div>
				</g:form>
			</div>
		</div>
	</div>
</body>
</html>