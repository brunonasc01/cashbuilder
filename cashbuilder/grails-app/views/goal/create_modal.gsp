<g:categoriesCombo category="categoryCombo" subcategory="subcategoriesCombo" action="selectedMultipleCategories" name="subcategories[X].id"  multipleSubs="true"/>

<g:javascript>
$('#bt_close_modal').click(function(){
	$('.overlay, .modal').hide();
});
</g:javascript>

<div class="box modal goal-modal">
	<h3 class="title-box">
		<g:message code="goal.box.title"/>
		<a id="bt_close_modal" class='bt-icon text-center'></a>
	</h3>
	
	<div class="content">
		<g:form controller="goal" action="save">

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

<r:layoutResources disposition="defer"/>