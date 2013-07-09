<g:categoriesCombo category="categoryCombo" subcategory="subcategoriesCombo"/>

<g:javascript>
$('#bt_close_modal').click(function(){
	$('.overlay, .modal').hide();
});
</g:javascript>

<div class="box modal cashflow-modal">
	<h3 class="title-box">
		<g:message code="box.transaction.edit.title"/>
		<a id="bt_close_modal" class='bt-icon text-center'></a>
	</h3>
	
	<div class="content">
		<g:form controller="transaction" action="update">
			<g:hiddenField name="id" value="${transaction?.id}" />
			<g:hiddenField name="monthId" value="${monthId }"></g:hiddenField>
	
			<label for="data"><g:message code="box.transaction.date.label"/>
			</label><g:jqDatePicker name="date" value="${transaction?.date }"/>
			
			<label for="valor"><g:message code="box.transaction.value.label"/>
			</label><g:textField maxlength="10" name="value" value="${df.format(transaction?.value)}" />
						
			<label for="categoria"><g:message code="box.transaction.category.label"/>
			</label><g:if test="${categoriesList}">
						 <g:select id="categoryCombo" name="category.id"
							from="${categoriesList.categories}" 
							optionKey="id" value="${transaction?.category.id}" noSelection="['': 'Selecione']" />
					</g:if>
					
			<label for="subCategoria"><g:message code="box.transaction.subcategory.label"/>
			</label><g:if test="${categoriesList}">
						<span id="subcategoriesCombo">
						 <g:select name="subcategory.id" from="${subcategoriesList}"
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

<r:layoutResources disposition="defer"/>
