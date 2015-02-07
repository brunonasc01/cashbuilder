<g:categoriesCombo category="categoryCombo" subcategory="subcategoriesCombo" action="selectedMultipleCategories" name="subcategories[X].id"  multipleSubs="true"/>

<g:javascript>
$('#bt_close_modal').click(function(){
	$('.overlay, .modal').hide();
});
</g:javascript>

<div class="box modal goal-modal">
	<h3 class="title-box">
		<g:message code="form.goal.title"/>
		<a id="bt_close_modal" class='bt-icon text-center'></a>
	</h3>

	<div class="content">
		<g:form controller="goal" action="save">
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

<r:layoutResources disposition="defer"/>