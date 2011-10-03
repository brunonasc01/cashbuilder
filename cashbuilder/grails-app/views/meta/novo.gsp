
<g:javascript>
$(document).ready(function() {
	ajaxComboSubcategoria("comboCategoria","/cashbuilder/categoria/categoriaMultipleSelected","comboSubcategorias");
	
	ajaxValidate("/cashbuilder/meta/validator","newGoalForm",true);
});
</g:javascript>

<g:form name="newGoalForm" controller="meta" action="save">

	<p class="title">Nova Meta</p>

	<div id="field">
		<div class="form-label span-3">
			<label><g:message code="meta.nome.label" default="Nome" /></label>
		</div>			              
		<div class="form-input span-5 last">
			<g:textField name="nome" value="${metaInstance?.nome}" />
		</div>
		<div class="form-msg-short span-7 append-5 prepend-2">
		</div>
	</div>
	
	<div class="clear"></div>

	<div id="field">
		<div class="form-label span-3">
			<label><g:message code="meta.valorFinal.label" default="Valor Desejado" /></label>
		</div>			              
		<div class="form-input span-5 last">
			<g:textField name="valorAlmejado" value="${metaInstance?.valorAlmejado}" />
		</div>
		<div class="form-msg-short span-7 append-5 prepend-2">
		</div>
	</div>
	
	<div class="clear"></div>
	
	<div id="field">
		<div class="form-label span-3">
			<label><g:message code="meta.dataInicio.label" default="Data Inicio" /></label>
		</div>			              
		<div class="form-input span-5 last">
			<g:jqDatePicker class="date" name="dataInicio" value="" />
		</div>
		<div class="form-msg-short span-7 append-5 prepend-2">
		</div>
	</div>

	<div class="clear"></div>

	<div id="field">
		<div class="form-label span-3">
			<label><g:message code="meta.dataFim.label" default="Data Fim" /></label>
		</div>			              
		<div class="form-input span-5 last">
			<g:jqDatePicker class="date" name="dataFim" value="" />
		</div>
		<div class="form-msg-short span-7 append-5 prepend-2">
		</div>
	</div>

	<div class="clear"></div>

	<div id="field">
		<div class="form-label span-3">
			<label><g:message code="pagamento.categoria.label" default="Categoria" /></label>
		</div>			              
		<div class="form-input span-5 last">
			<g:if test="${listCategorias}">
				 <g:select id="comboCategoria" name="select"
					from="${listCategorias?.categorias}" 
					optionKey="id" value="" noSelection="['': 'Selecione']" />
			</g:if>	
		</div>
		<div class="form-msg-short span-7 append-5 prepend-2">
		</div>
	</div>

	<div class="clear"></div>

	<g:set var="counter" value="${0}" />

	<div class="form-label span-3">
		<label><g:message code="pagamento.subcategoria.label" default="Subcategoria" /></label>
	</div>			              
	<div class="form-input span-5 last">
		<g:if test="${listCategorias}">
			<span id="comboSubcategorias">
			 <g:select name="subcategorias[${counter}].id"
				from="${listCategorias?.subcategorias}" 
				optionKey="id" value="" noSelection="['': 'Selecione']" />
			</span>
		</g:if>
	</div>
	<div class="form-msg-short span-7 append-5 prepend-2">
	</div>
	
	<div class="clear"></div>
	
	<div id="submitField">	
		<div class="span-4 prepend-3">
			<input type="submit" name="save" value="Gravar" class="save" />
		</div>
		<div class='alert-msg span-7 prepend-3 last'></div>
	</div>
	
</g:form>