
<g:javascript>
$(document).ready(function() {
	ajaxComboSubcategoria("comboCategoria","/cashbuilder/categoria/categoriaSelected","comboSubcategorias");
	
	ajaxValidate("/cashbuilder/pagamento/validator","newTransaction",true);
});
</g:javascript>

<g:form name="newTransaction" action="save" class="regform" controller="pagamento">

	<div id="field">
		<ul>
			<li class="label">
				<g:message code="pagamento.data.label" default="Data" />
			</li>
			<li class="input">
				<g:jqDatePicker class="date" name="data" value="" />
			<li>
			<li class="message"></li>
		</ul>
	</div>

	<div class="clear"></div>

	<div id="field">
		<ul>
			<li class="label">
				<g:message code="pagamento.valor.label" default="Valor" />
			</li>
			<li class="input">
				<g:textField maxlength="10" name="valor" value="" />
			<li>
			<li class="message"></li>
		</ul>
	</div>
		
	<div class="clear"></div>

	<div id="field">
		<ul>
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
	</div>

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
	
	<div id="field">
		<ul>
			<li class="label">
				<g:message code="pagamento.descricao.label" default="Descricao" />			
			</li>
			<li class="input">
				<g:textField size="33" maxlength="150" name="descricao" value="" />
			<li>
			<li class="message"></li>
		</ul>
	</div>
	
	<div id="submitField">
		<ul>
			<li class="button">
				<input type="submit" name="save" value="Gravar"/>
			</li>
			<li class="message"></li>
		</ul>
	</div>           
	
</g:form>