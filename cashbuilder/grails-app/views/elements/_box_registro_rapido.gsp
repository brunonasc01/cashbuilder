
<g:categoriesCombo trigger="categoryCombo" target="subcategoriesCombo"/>

<g:javascript>
enableParcels();
</g:javascript>

<div id="lbox">
	<g:form class="boxForm" name="xpNewReg" action="saveTransaction" controller="home">
		<div class="title">
			Novo Lancamento
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
					<g:if test="${registroRapido}">
						 <g:select id="categoryCombo" name="category.id"
							from="${registroRapido.categories}" 
							optionKey="id" value="" noSelection="['': 'Selecione']" />
					</g:if>
				</li>
				
				<li class="label">
					<g:message code="pagamento.subcategoria.label" default="Subcategoria" />*
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
</div>