
<g:javascript>
$(document).ready(function() {
	ajaxComboSubcategoria("comboCategoria","/cashbuilder/categoria/categoriaSelected","comboSubcategorias");
	
	//ajaxValidate("/cashbuilder/pagamento/validator","newPaymentForm",true);
});
</g:javascript>

<g:form name="newPaymentForm" action="save" class="regform" controller="pagamento">

	<div id="field">
		<ul>
			<li>
				<label><g:message code="pagamento.data.label" default="Data" /></label>
				<g:jqDatePicker class="date" name="data" value="" />
			<li>
			<li>
				mensagem		
			</li>
		</ul>
	</div>

	<div class="clear"></div>

	<div id="field">
		<ul>
			<li>
				<label><g:message code="pagamento.valor.label" default="Valor" /></label>
				<g:textField maxlength="10" name="valor" value="" />
			<li>
			<li>
				mensagem		
			</li>
		</ul>
	</div>
		
	<div class="clear"></div>

	<div id="field">
		<ul>
			<li>
				<label><g:message code="pagamento.categoria.label" default="Categoria" /></label>
				<g:if test="${listCategorias}">
					 <g:select id="comboCategoria" name="categoria.id"
						from="${listCategorias?.categorias}" 
						optionKey="id" value="" noSelection="['': 'Selecione']" />
				</g:if>
			<li>
			<li>
				mensagem		
			</li>
		</ul>
	</div>

	<div class="clear"></div>
	
	<ul>
		<li>
			<label><g:message code="pagamento.subcategoria.label" default="Subcategoria" /></label>
			<g:if test="${listCategorias}">
				<span id="comboSubcategorias">
					<g:select name="subcategoria.id"
						noSelection="['': 'Selecione uma categoria']" />
				</span>
			</g:if>
		<li>
		<li>
			mensagem		
		</li>
	</ul>

	<div class="clear"></div>
	
	<div id="field">
		<ul>
			<li>
				<label><g:message code="pagamento.descricao.label" default="Descricao" /></label>
				<g:textField size="33" maxlength="150" name="descricao" value="" />
			<li>
			<li>
				mensagem		
			</li>
		</ul>
	</div>
	
	<div id="submitField">
		<ul>
			<li>
				<input type="submit" name="save" value="Save" class="save" />
				<input type="reset" name="clean" value="Limpar" class="cancel" />
			</li>
			<li>
				mensagem
			</li>
		</ul>
	</div>           
	
</g:form>