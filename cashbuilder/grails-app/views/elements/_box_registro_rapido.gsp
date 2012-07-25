
<g:categoriesCombo trigger="categoryCombo" target="subcategoriesCombo"/>

<div id="lbox">
	<g:form class="boxForm" name="xpNewReg" action="saveTransaction" controller="home">
		<div class="title">
			<g:message code="box.transaction.title"/>
		</div>

		<div class="inside">
            <g:if test="${flash.message}">	    		
				<div class="form-errors">
					${flash.message}
				</div>
			</g:if>
		
			<div class="clear"></div>
			
			<small><g:message code="form.compulsory.message" /></small>
		
			<ul id="field">
				<li class="label">
					<g:message code="box.transaction.date.label"/>*
				</li>
				<li class="input">
					<g:jqDatePicker class="date" name="date" value="" />
				</li>
			</ul>

			<hr />
			
			<ul>
				<li class="label">
					<g:message code="box.transaction.value.label"/>*
				</li>
				<li class="input">
					<g:textField maxlength="10" name="value" value="" />
				</li>
				
				<li class="label">
					<g:message code="box.transaction.parcels.label" />
				</li>
				<li class="input">
					<g:select name="parcels" from="${1..24}"/>
				</li>
			</ul>
			
			<hr />
			
			<ul id="field">
				<li class="label">
					<g:message code="box.transaction.category.label"/>*
				</li>
				<li class="input category">
					<g:if test="${registroRapido}">
						 <g:select id="categoryCombo" name="category.id"
							from="${registroRapido.categories}" 
							optionKey="id" value="" noSelection="['': 'Selecione']" />
					</g:if>
				</li>
				
				<li class="label">
					<g:message code="box.transaction.subcategory.label"/>*
				</li>
				<li class="input subcategory">
					<g:if test="${registroRapido}">
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
					<g:message code="box.transaction.description.label"/>
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
</div>