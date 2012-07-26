
<g:javascript>
styleButtons();
</g:javascript>

<g:categoriesCombo trigger="categoryCombo" target="subcategoriesCombo"/>

<g:form class="boxForm" name="editTransaction" action="update" controller="transaction">
	<div class="title popup-title-border">
		<g:message code="box.transaction.edit.title"/>
	</div>
	
	<g:hiddenField name="id" value="${transaction?.id}" />
	<g:hiddenField name="monthId" value="${monthId }"></g:hiddenField>
	
	<div class="inside">
		<small><g:message code="form.compulsory.message" /></small>
	
		<ul id="field">
			<li class="label">
				<g:message code="box.transaction.date.label"/>*
			</li>
			<li class="input">
				<g:jqDatePicker class="date" name="date" value="${transaction?.date }" />
			</li>
		</ul>
	
		<hr />
		
		<ul>
			<li class="label">
				<g:message code="box.transaction.value.label"/>*
			</li>
			<li class="input">
				<g:textField maxlength="10" name="value" value="${df.format(transaction?.value)}" />
			</li>
		</ul>
		
		<hr />
	
		<ul id="field">
			<li class="label">
				<g:message code="box.transaction.category.label"/>*
			</li>
			<li class="input category">
				<g:if test="${categoriesList}">
					 <g:select id="categoryCombo" name="category.id"
						from="${categoriesList.categories}" 
						optionKey="id" value="${transaction?.category.id}" noSelection="['': 'Selecione']" />
				</g:if>
			</li>
			
			<li class="label">
				<g:message code="box.transaction.subcategory.label"/>*
			</li>
			<li class="input subcategory">
				<g:if test="${categoriesList}">
					<span id="subcategoriesCombo">
					 <g:select name="subcategory.id" from="${categoriesList.subcategories}"
						optionKey="id" value="${transaction?.subcategory.id}" noSelection="['': 'Selecione uma categoria']" />
					</span>
				</g:if>
			</li>
		</ul>

		<hr />
		
		<ul id="field">
			<li class="label">
				<g:message code="box.transaction.description.label"/>
			</li>
			<li class="input">
				<g:textField name="description" maxlength="100" size="64" value="${transaction?.description }"></g:textField>
			</li>
		</ul>
		
		<hr />
						
		<ul id="submitField">
			<li class="button">
				<g:submitButton name="gravar" class="save" value="Gravar" />
			</li>
		</ul>
		
		<div class="clear"></div>
	</div>
</g:form>

<r:layoutResources disposition="defer"/>