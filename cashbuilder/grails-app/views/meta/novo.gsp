
<g:javascript>
$(document).ready(function() {
	ajaxComboSubcategoria("comboCategoria","/cashbuilder/categoria/categoriaMultipleSelected","comboSubcategorias");
});
</g:javascript>

<g:form controller="meta">

	<p class="title">Nova Meta</p>

	<div class="form-label span-4">
		<label for="nome">Nome</label>
	</div>			              
	<div class="span-6 last">
		<g:textField name="nome" value="${metaInstance?.nome}" />
	</div>
	
	<div class="clear"></div>

	<div class="form-label span-4">
		<label for="valorAlmejado">Valor Desejado</label>
	</div>			              
	<div class="span-6 last">
		<g:textField name="valorAlmejado" value="${metaInstance?.valorAlmejado}" />
	</div>
	
	<div class="form-label span-4">
		<label for="dataInicio">Data Inicio</label>
	</div>			              
	<div class="span-6 last">
		<g:jqDatePicker class="date" name="dataInicio" value="${metaInstance?.dataInicio}" />
	</div>

	<div class="clear"></div>

	<div class="form-label span-4">
		<label for="dataFim">Data Fim</label>
	</div>			              
	<div class="span-6 last">
		<g:jqDatePicker class="date" name="dataFim" value="${metaInstance?.dataFim}" />
	</div>

	<div class="form-label span-4">
		<label for="categoria"><g:message code="pagamento.categoria.label" default="Categoria" /></label>
	</div>			              
	<div class="span-6 last">
		<g:if test="${listCategorias}">
			 <g:select id="comboCategoria" name="select"
				from="${listCategorias?.categorias}" 
				optionKey="id" value="" noSelection="['': 'Selecione']" />
		</g:if>	
	</div>

	<g:set var="counter" value="${0}" />

	<div class="form-label span-4">
		<label for="subcategoria"><g:message code="pagamento.subcategoria.label" default="Subcategoria" /></label>
	</div>			              
	<div class="span-6 last">
		<g:if test="${listCategorias}">
			<span id="comboSubcategorias">
			 <g:select name="subcategorias[${counter}].id"
				from="${listCategorias?.subcategorias}" 
				optionKey="id" value="" noSelection="['': 'Selecione']" />
			</span>
		</g:if>
	</div>
	
	<div class="clear"></div>
	
	<div class="span-8 prepend-4 last">
		<span class="button"><input type="submit" name="_action_save" value="Save" class="save" /></span>
	</div>         
	
</g:form>