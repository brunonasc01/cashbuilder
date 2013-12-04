<!DOCTYPE html>
<html lang="pt-BR">

<head>
	<g:set var="wrapper_class" value="wrapper-50" scope="request"></g:set>
    <meta name="layout" content="base" />
    <r:require modules="adm"/>
    
    <g:categoriesCombo category="categoryCombo" subcategory="subcategoriesCombo" action="selectedMultipleCategories" name="newSubcategories[X].id"  multipleSubs="true"/>
</head>

<body>
	<div id="month-title" class="col-1">
		<h2 class="title-box">
			<g:message code="form.manager.category.delete.title"/>
		</h2>
	</div>

	<g:render template="/elements/message"></g:render>

	<div class="col-1">
		<div class="box">
			<div class="content">
				<small><g:message code="form.manager.category.delete.message"/></small>
			
				<g:form name="editCategory" controller="category" >
					<g:hiddenField name="full_scr" value="true"></g:hiddenField>
				
					<div class="content-center">
						<g:actionSubmit class="btn" action="delete_all" value="Remover Transacoes" onclick="return confirm('Tem Certeza?')"/>
					</div>
				
					<hr/>
				
					<h4>${oldCategory.name }</h4>
				
					<g:hiddenField name="id" value="${oldCategory.id }"/>
					
					<label><g:message code="form.label.category"/>
					</label><g:if test="${categoriesList}">
								 <g:comboBox id="categoryCombo" name="newId"
									from="${categoriesList.categories}" 
									optionKey="id" nameDisplayPrefix="label" />
							</g:if>
					
					<g:each var="subcategory" in="${oldCategory.subcategories}" status="i">
						<label>[${i+1}] ${subcategory.name}
						</label><g:if test="${categoriesList}">
									<span id="subcategoriesCombo[${i}]">
										<g:select name="newSubcategories[${i}].id" from=""
										noSelection="['': 'Selecione uma categoria']" />
									</span>
								</g:if>
					</g:each>
		
					<div class="content-center">
						<g:actionSubmit class="btn" action="update_deletion" value="Remover" onclick="return confirm('Tem Certeza?')" />
					</div>
				</g:form>
			</div>
		</div>
	</div>
</body>

</html>