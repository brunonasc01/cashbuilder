
<g:javascript>
styleButtons()
</g:javascript>

<g:categoriesCombo trigger="categoryCombo" target="subcategoriesCombo" action="selectedMultipleCategories"/>

<g:form class="boxForm" name="newGoal" action="save" controller="goal">

	<div class="title popup-title-border">
		<g:message code="goal.box.title"/>
	</div>
	
	<div class="inside">
		<small><g:message code="form.compulsory.message" /></small>

		<ul>
			<li class="label">
				<g:message code="goal.box.title.label"/>*
			</li>
			<li class="input">
				<input type="text" maxlength="45" size="64" name="title" value=""/>
			</li>
		</ul>

		<hr />
	
		<ul>
			<li class="label">
				<g:message code="goal.box.total.label"/>*
			</li>
			<li class="input">
				<g:textField maxlength="10" name="total" value="" />
			</li>
		</ul>

		<hr />
		
		<ul>
			<li class="label">
				<g:message code="goal.box.start.date.label"/>*
			</li>
			<li class="input">
				<g:jqDatePicker class="date" name="startDate" value="" />
			</li>
		</ul>
		
		<ul>
			<li class="label">
				<g:message code="goal.box.end.date.label"/>*
			</li>
			<li class="input">
				<g:jqDatePicker class="date" name="endDate" value="" />
			</li>
		</ul>
		
		<hr />

		<ul>
			<li class="label">
				<g:message code="goal.box.category.label"/>*
			</li>
			<li class="input category">
				<g:if test="${categoriesList}">
					 <g:select id="categoryCombo" name="select"
						from="${categoriesList.categories}" 
						optionKey="id" value="" noSelection="['': 'Selecione']" />
				</g:if>	
			</li>
		</ul>

		<g:set var="counter" value="${0}" />
	
		<ul>
			<li class="label">
				<g:message code="goal.box.subcategory.label"/>*
			</li>
			<li class="input subcategory">
				<g:if test="${categoriesList}">
					<span id="subcategoriesCombo">
					 <g:select name="subcategory[${counter}].id"
						from="" noSelection="['': 'Selecione uma categoria']" />
					</span>
				</g:if>
			</li>
		</ul>
	
		<hr />

		<ul>
			<li class="button">
				<input type="submit" name="save" value="Gravar"/>
			</li>
		</ul>
		
		<div class="clear"></div>
	</div>
</g:form>

<r:layoutResources disposition="defer"/>