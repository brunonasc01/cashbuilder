<g:categoriesCombo category="categoryCombo" subcategory="subcategoriesCombo" action="selectedMultipleCategories" name="newSubcategories[X].id"  multipleSubs="true"/>

<g:javascript>
$('#bt_close_modal').click(function(){
	$('.overlay, .modal').hide();
});
</g:javascript>

<div class="box modal adm-modal">
	<h3 class="title-box">
		<g:message code="manager.category.delete.label"/>
		<a id="bt_close_modal" class='bt-icon text-center'></a>
	</h3>

	<div class="content">
		<small><g:message code="manager.category.delete.message"/></small>
	
		<hr/>
	
		<h4>${oldCategory.name }</h4>
	
		<g:form name="editCategory" action="update_deletion" controller="category" >
			<g:hiddenField name="id" value="${oldCategory.id }"/>
			
			<label><g:message code="manager.category.label"/>
			</label><g:if test="${categoriesList}">
						 <g:select id="categoryCombo" name="newId"
							from="${categoriesList.categories}" 
							optionKey="id" value="" noSelection="['': 'Selecione']" />
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
				<input type="submit" class="btn" id="submit" value="Gravar"/>
			</div>
		</g:form>
	</div>
</div>

<r:layoutResources disposition="defer"/>