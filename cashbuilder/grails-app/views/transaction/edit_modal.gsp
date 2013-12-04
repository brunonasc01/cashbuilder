<g:categoriesCombo category="categoryCombo" subcategory="subcategoriesCombo"/>

<g:javascript>
$('#bt_close_modal').click(function(){
	$('.overlay, .modal').hide();
});
</g:javascript>

<div class="box modal cashflow-modal">
	<h3 class="title-box">
		<g:message code="form.transaction.edit.title"/>
		<a id="bt_close_modal" class='bt-icon text-center'></a>
	</h3>
	
	<div class="content">
		<g:form controller="transaction" action="update">
			<g:hiddenField name="id" value="${transaction?.id}" />
			<g:hiddenField name="monthId" value="${monthId }"></g:hiddenField>
	
			<label for="data"><g:message code="form.transaction.label.date"/>
			</label><g:jqDatePicker name="date" value="${transaction?.date }"/>
			<label for="valor"><g:message code="form.transaction.label.value"/>
			</label><g:textField maxlength="10" name="value" value="${df.format(transaction?.value)}" />
			<label for="categoria"><g:message code="form.label.category"/>
			</label><g:if test="${categoriesList}">
						 <g:comboBox id="categoryCombo" name="category.id"
							from="${categoriesList.categories}" nameDisplayPrefix="label"
							optionKey="id" value="${transaction?.category.id}"/>
					</g:if>
			<label for="subCategoria"><g:message code="form.label.subcategory"/>
			</label><g:if test="${categoriesList}">
						<span id="subcategoriesCombo">
						 <g:comboBox name="subcategory.id" from="${subcategoriesList}" 
							optionKey="id" value="${transaction?.subcategory.id}" nameDisplayPrefix="label" />
						</span>
					</g:if>
			<label for="descricao"><g:message code="form.transaction.label.description"/>
			</label><g:textField name="description" maxlength="100" size="64" value="${transaction?.description }"></g:textField>

			<div class="content-center">
					<g:submitButton name="gravar" class="btn" value="Atualizar" />
			</div>
		</g:form>
	</div>
</div>

<r:layoutResources disposition="defer"/>
