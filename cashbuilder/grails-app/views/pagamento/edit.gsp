<g:javascript>
$(document).ready(function() {
	ajaxComboSubcategoria("comboCategoria","/cashbuilder/categoria/categoriaSelected","comboSubcategorias");
	ajaxValidate("/cashbuilder/pagamento/validator","editTransaction",true);
});
</g:javascript>

<g:if test="${pagamento }">
	<g:form class="modalForm" name="editTransaction" action="update" controller="pagamento">
		<g:hiddenField name="id" value="${pagamento?.id}" />
		<g:hiddenField name="version" value="${pagamento?.version}" />

		<ul id="field">
			<li class="label">
				<g:message code="pagamento.data.label" default="Data" />
			</li>
			<li class="input">
				<g:jqDatePicker class="date" name="data" value="${pagamento?.data }" />
			<li>
			<li class="message"></li>
		</ul>

		<div class="clear"></div>

		<ul id="field">
			<li class="label">
				<g:message code="pagamento.valor.label" default="Valor" />
			</li>
			<li class="input">
				<g:textField maxlength="10" name="valor" value="${df.format(pagamento?.valor)}" />
			<li>
			<li class="message"></li>
		</ul>

		<div class="clear"></div>

		<ul id="field">
			<li class="label">
				<g:message code="pagamento.categoria.label" default="Categoria" />
			</li>
			<li class="input">
				<g:if test="${listCategorias}">
					 <g:select id="comboCategoria" name="categoria.id"
						from="${listCategorias?.categorias}" 
						optionKey="id" value="${pagamento?.categoria.id}" noSelection="['': 'Selecione']" />
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
					 <g:select name="subcategoria.id"
						from="${listCategorias?.subcategorias}" 
						optionKey="id" value="${pagamento?.subcategoria.id }" noSelection="['': 'Selecione']" />
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
				<g:textField size="33" maxlength="150" name="descricao" value="${pagamento?.descricao }" />
			<li>
			<li class="message"></li>
		</ul>

		<div class="clear"></div>
		
		<ul id="submitField">
			<li class="button">
				<input type="submit" name="update" value="Update" class="edit" />
			</li>
			<li class="message"></li>
		</ul>
	</g:form>			
</g:if>