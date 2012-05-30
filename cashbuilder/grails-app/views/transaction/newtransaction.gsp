
<g:javascript>
styleButtons();
enableParcels();
</g:javascript>

<g:categoriesCombo trigger="categoryCombo" target="subcategoriesCombo"/>

<g:form class="boxForm" name="newTransaction" action="save" controller="transaction">
	<div class="title">
		Novo Lancamento
	</div>
	
	<g:hiddenField name="monthId" value="${monthId }"></g:hiddenField>
	
	<div class="inside">
		<small><g:message code="form.compulsory.message" /></small>
	
		<ul id="field">
			<li class="label">
				<g:message code="pagamento.data.label" default="Data" />
			</li>
			<li class="input">
				<g:jqDatePicker class="date" name="date" value="" />
			</li>
		</ul>
	
		<hr />
		
		<ul>
			<li class="label">
				<g:message code="pagamento.valor.label" default="Valor" />*
			</li>
			<li class="input">
				<g:textField maxlength="10" name="value" value="" />
			</li>
			
			<li class="label">
				<g:message code="pagamento.parcel.label" default="Parcelado ?" />
			</li>
			<li class="composed_input">
				<g:checkBox name="parcel" />
				<small id="parcel_msg">marque para inserir</small>
				<g:textField maxlength="2" size="2" name="parcels" value="1" />
			</li>
		</ul>
		
		<hr />
	
		<ul id="field">
			<li class="label">
				<g:message code="pagamento.categoria.label" default="Categoria" />*
			</li>
			<li class="input category">
				<g:if test="${categoriesList}">
					 <g:select id="categoryCombo" name="category.id"
						from="${categoriesList.categories}" 
						optionKey="id" value="" noSelection="['': 'Selecione']" />
				</g:if>
			</li>
			
			<li class="label">
				<g:message code="pagamento.subcategoria.label" default="Subcategoria" />*
			</li>
			<li class="input subcategory">
				<g:if test="${categoriesList}">
					<span id="subcategoriesCombo">
					 <g:select name="subcategory.id" from=""
						noSelection="['': 'Selecione uma categoria']" />
					</span>
				</g:if>
			</li>
		</ul>

		<hr />
		
		<ul id="field">
			<li class="label">
				<g:message code="pagamento.descricao.label" default="Descricao" />
			</li>
			<li class="input">
				<g:textField name="description" maxlength="100" size="64"></g:textField>
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