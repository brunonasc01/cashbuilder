
<g:categoriesCombo category="categoryCombo" subcategory="subcategoriesCombo"/>

<div class="box">
	<g:form action="saveTransaction" controller="home">
		<h3 class="title-box"><g:message code="box.transaction.title"/></h3>

		<div class="content">
			<label for="data"><g:message code="box.transaction.date.label"/>
			</label><g:jqDatePicker name="date"/>
			
			<label for="valor"><g:message code="box.transaction.value.label"/>
			</label><g:textField maxlength="10" name="value" value="" />
			
			<label for="parcelas"><g:message code="box.transaction.parcels.label" />
			</label><g:select name="parcels" from="${1..24}" optionValue="${{it == 1? "à vista" : it}}"/>
						
			<label for="categoria"><g:message code="box.transaction.category.label"/>
			</label><g:if test="${registroRapido}">
						 <g:comboBox id="categoryCombo" name="category.id"
							from="${registroRapido.categories}" 
							optionKey="id" nameDisplayPrefix="label"/>
					</g:if>
					
			<label for="subCategoria"><g:message code="box.transaction.subcategory.label"/>
			</label><g:if test="${registroRapido}">
						<span id="subcategoriesCombo">
						 <g:comboBox name="subcategory.id" from=""
							defaultOption="['': 'Selecione uma categoria']" />
						</span>
					</g:if>
						
			<label for="descricao"><g:message code="box.transaction.description.label"/>
			</label><g:textField name="description" maxlength="100" size="64"></g:textField>

			<div class="content-center">
					<g:submitButton name="gravar" class="btn" value="Gravar" />
			</div>
		</div>
	</g:form>			
</div>