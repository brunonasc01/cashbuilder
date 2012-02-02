
<g:javascript>
$(document).ready(function() {
	$("input:submit, button, input:reset").button();
});
</g:javascript>

<g:comboCategorias trigger="comboCategoria" target="comboSubcategorias"/>
<g:validateForm controller="pagamento" form="newTransaction" />

<g:form class="modalForm" name="newTransaction" action="save" controller="pagamento">

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
					<g:select name="subcategoria.id"
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
			<g:textField size="33" maxlength="150" name="descricao" value="" />
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

</g:form>