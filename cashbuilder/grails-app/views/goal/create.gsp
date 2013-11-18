<!DOCTYPE html>
<html lang="pt-BR">

<head>
	<g:set var="wrapper_class" value="wrapper-50" scope="request"></g:set>
    <meta name="layout" content="base" />
    <r:require modules="goal"/>
    
    <g:categoriesCombo category="categoryCombo" subcategory="subcategoriesCombo" action="selectedMultipleCategories" name="subcategories[X].id"  multipleSubs="true"/>
</head>

<body>

	<div id="month-title" class="col-1">
		<h2 class="title-box">
			<g:message code="goal.box.title"/>
		</h2>
	</div>

	<g:render template="/elements/message"></g:render>

	<div class="col-1">
		<div class="box">
			<div class="content">
				<g:form controller="goal" action="save">
					<g:hiddenField name="full_scr" value="true"></g:hiddenField>
		
					<label><g:message code="goal.box.title.label"/>
					</label><g:textField name="title" value="" />
					
					<label><g:message code="goal.box.total.label"/>
					</label><g:textField maxlength="10" name="total" value="" />
		
					<label><g:message code="goal.box.start.date.label"/>
					</label><g:jqDatePicker name="startDate"/>
					
					<label><g:message code="goal.box.end.date.label"/>
					</label><g:jqDatePicker name="endDate"/>
		
					<label for="categoria"><g:message code="goal.box.category.label"/>
					</label><g:if test="${categoriesList}">
							 <g:comboBox id="categoryCombo" name="select"
								from="${categoriesList.categories}" 
								optionKey="id" nameDisplayPrefix="label" />
						</g:if>	
		
					<g:set var="counter" value="${0}" />
		
		    		<label for="subCategoria"><g:message code="goal.box.subcategory.label"/>
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