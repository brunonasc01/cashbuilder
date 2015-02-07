<g:categoriesCombo category="categoryCombo" subcategory="subcategoriesCombo"/>

<div class="box">
	<g:form action="saveTransaction" controller="home">
		<h3 class="title-box"><g:message code="form.transaction.title"/></h3>

		<div class="content">
			<label for="data"><g:message code="form.transaction.label.date"/>
			</label><g:jqDatePicker name="date" value="${new Date() }"/>
			<label for="valor"><g:message code="form.transaction.label.value"/>
			</label><g:textField maxlength="10" name="value" value="" />
			<label for="parcelas"><g:message code="form.transaction.label.parcels"/>
			</label><g:select name="parcels" from="${1..24}" optionValue="${{it == 1? "à vista" : it}}"/>
			<label for="categoria"><g:message code="form.label.category"/>
			</label><g:if test="${registroRapido}">
						<g:comboBox id="categoryCombo" name="category.id" from="${registroRapido.categories}" 
							optionKey="id" nameDisplayPrefix="label"/>
					</g:if>
			<label for="subCategoria"><g:message code="form.label.subcategory"/>
			</label><g:if test="${registroRapido}">
						<span id="subcategoriesCombo">
							<g:comboBox name="subcategory.id" defaultOption="['': 'Selecione uma categoria']" />
						</span>
					</g:if>
			<label for="descricao"><g:message code="form.transaction.label.description"/>
			</label><g:textField name="description" maxlength="100" size="64"></g:textField>
			<div class="content-center">
					<g:submitButton name="gravar" class="btn" value="Gravar" />
			</div>
		</div>
	</g:form>
</div>