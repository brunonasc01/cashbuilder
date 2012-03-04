
<g:javascript>
styleButtons();
enableParcels();
</g:javascript>

<g:comboCategorias trigger="comboCategoria" target="comboSubcategorias"/>
<g:validateForm controller="pagamento" form="newTransaction" />

<g:form class="modalForm" name="newTransaction" action="save" controller="pagamento">
	<div class="title">
		Novo Lancamento
	</div>
	
	<g:hiddenField name="mesId" value="${mesId }"></g:hiddenField>
	<g:hiddenField name="natureza" value="D"></g:hiddenField>
	<g:hiddenField name="user.id" value="-1"></g:hiddenField>

	<div class="inside">
		<ul id="field">
			<li class="label">
				<g:message code="pagamento.data.label" default="Data" />
			</li>
			<li class="input">
				<g:jqDatePicker class="date" name="data" value="" />
			<li>
			<li class="message"></li>
		</ul>
	
		<div class="clear"></div>
		
		<ul id="field">
			<li class="label">
				<g:message code="pagamento.valor.label" default="Valor" />
			</li>
			<li class="input">
				<g:textField maxlength="10" name="valor" value="" />
			<li>
			<li class="message"></li>
		</ul>
			
		<div class="clear"></div>
		
		<div id="hidden_element">
			<ul id="field">
				<li class="label">
					<g:message code="pagamento.parcel.label" default="Parcelado ?" />
				</li>
				<li class="composed_input">
					<g:checkBox name="parcel" />
					<small id="parcel_msg">marque para inserir as parcelas</small>
					<g:textField maxlength="2" size="2" name="parcels" value="1" />
				</li>
				<li class="message"></li>
			</ul>
	
			<div class="clear"></div>
		</div>
	
		<ul id="field">
			<li class="label">
				<g:message code="pagamento.categoria.label" default="Categoria" />
			</li>
			<li class="input">
				<g:if test="${listCategorias}">
					 <g:select id="comboCategoria" name="categoria.id"
						from="${listCategorias?.categorias}" 
						optionKey="id" value="" noSelection="['': 'Selecione']" />
				</g:if>
			<li>
			<li class="message"></li>
		</ul>
	
		<div class="clear"></div>
		
		<ul>
			<li class="label">
				<g:message code="pagamento.subcategoria.label" default="Subcategoria" />
			</li>
			<li class="input">
				<g:if test="${listCategorias}">
					<span id="comboSubcategorias">
						<g:select name="subcategoria.id" from=""
							noSelection="['': 'Selecione uma categoria']" />
					</span>
				</g:if>
			<li>
			<li class="message"></li>
		</ul>
	
		<div class="clear"></div>
		
		<ul id="field">
			<li class="label">
				<g:message code="pagamento.descricao.label" default="Descricao" />			
			</li>
			<li class="input">
				<g:textArea maxlength="150" name="descricao" value="" />
			<li>
			<li class="message"></li>
		</ul>
		
		<div class="clear"></div>
	
		<ul id="submitField">
			<li class="button">
				<input type="submit" name="save" value="Gravar"/>
			</li>
			<li class="message"></li>
		</ul>
		
		<div class="clear"></div>
	</div>
</g:form>

<r:layoutResources disposition="defer"/>