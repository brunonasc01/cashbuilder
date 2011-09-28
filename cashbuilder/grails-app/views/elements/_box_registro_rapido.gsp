
<g:javascript>
$(document).ready(function() {
	ajaxComboSubcategoria("comboCategoria","/cashbuilder/categoria/categoriaSelected","comboSubcategorias");
});
</g:javascript>

<div class="box registro_rapido ui-corner-all shadow_box">
	<g:form class="regform" action="save_registro" controller="home">
		<p class="title">Registro Rápido</p>
			
		<div class="form-label span-3">
			<label><g:message code="pagamento.data.label" default="Data" /></label>
		</div>			              
		<div class="form-input span-5 last">
			<g:jqDatePicker class="date" name="data" value="" />
		</div>
		<div class="form-msg-short span-7 append-5 prepend-2">
		</div>

		<div class="form-label span-3">
			<label><g:message code="pagamento.valor.label" default="Valor" /></label>
		</div>			              
		<div class="form-input span-5 last">
			<g:textField maxlength="10" name="valor" value="" />
		</div>
		<div class="form-msg-short span-7 append-5 prepend-2">
		</div>

		<div class="form-label span-3">
			<label><g:message code="pagamento.categoria.label" default="Categoria" /></label>
		</div>			              
		<div class="form-input span-5 last">
			<g:if test="${registroRapido}">
				 <g:select id="comboCategoria" name="categoria.id"
					from="${registroRapido.categorias}" 
					optionKey="id" value="" noSelection="['': 'Selecione']" />
			</g:if>
		</div>
		<div class="form-msg-short span-7 append-5 prepend-2">
		</div>

		<div class="form-label span-3">
			<label><g:message code="pagamento.subcategoria.label" default="Subcategoria" /></label>
		</div>			              
		<div class="form-input span-5 last">
			<g:if test="${registroRapido}">
				<span id="comboSubcategorias">
				 <g:select name="subcategoria.id"
					noSelection="['': 'Selecione uma categoria']" />
				</span>
			</g:if>
		</div>
		<div class="form-msg-short span-7 append-5 prepend-2">
		</div>

		<div class="form-label span-3">
			<label><g:message code="usuario.descricao.label" default="Descricao" /></label>
		</div>			              
		<div class="form-input span-5 last">
			<g:textField maxlength="150" name="descricao" value="" />
		</div>
		<div class="form-msg-short span-7 append-5 prepend-2">
		</div>
		
		<div class="span-11 prepend-3">
			<g:submitButton name="gravar" class="save" value="Gravar" />
			<g:submitButton name="limpar" class="reset" type="reset" value="${message(code: 'default.button.clean.label', default: 'Limpar')}" />
		</div>
	</g:form>			
</div>