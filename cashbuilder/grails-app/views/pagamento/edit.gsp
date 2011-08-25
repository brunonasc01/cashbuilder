<g:javascript>
$(document).ready(function() {
	ajaxComboSubcategoria("comboCategoria","/cashbuilder/categoria/categoriaSelected","comboSubcategorias");
});
</g:javascript>

<g:if test="${pagamento }">
	<g:form class="regform" controller="pagamento">
		<g:hiddenField name="id" value="${pagamento?.id}" />
		<g:hiddenField name="version" value="${pagamento?.version}" />
	
		<p class="title">Editar Pagamento</p>

		<div class="form-label span-3">
			<label for="data"><g:message code="pagamento.data.label" default="Data" /></label>
		</div>
		<div class="span-5 append-3 last">
			<g:jqDatePicker class="date" name="data" value="${pagamento?.data }" />
		</div>

		<div class="form-label span-3">
			<label for="valor"><g:message code="pagamento.valor.label" default="Valor" /></label>
		</div>
		<div class="span-5 append-3 last">
			<g:textField size="10" maxlength="10" name="valor" value="${df.format(pagamento?.valor)}" />
		</div>

		<div class="form-label span-3">
			<label for="categoria"><g:message code="pagamento.categoria.label" default="Categoria" /></label>
		</div>	
		<div class="span-5 append-3 last">
			<g:if test="${listCategorias}">
				 <g:select id="comboCategoria" name="categoria.id"
					from="${listCategorias?.categorias}" 
					optionKey="id" value="${pagamento?.categoria.id}" noSelection="['': 'Selecione']" />
			</g:if>		
		</div>

		<div class="form-label span-3">
			<label for="subcategoria"><g:message code="pagamento.subcategoria.label" default="Subcategoria" /></label>
		</div>

		<div class="span-5 append-3 last">
			<g:if test="${listCategorias}">
				<span id="comboSubcategorias">
				 <g:select name="subcategoria.id"
					from="${listCategorias?.subcategorias}" 
					optionKey="id" value="${pagamento?.subcategoria.id }" noSelection="['': 'Selecione']" />
				</span>
			</g:if>
		</div>

		<div class="form-label span-3">
			<label for="descricao"><g:message code="usuario.descricao.label" default="Descricao" /></label>
		</div>			              
		<div class="span-8 last">
			<g:textField size="45" maxlength="150" name="descricao" value="${pagamento?.descricao }" />
		</div>

		<div class="span-5 prepend-6">
			<span class="button"><input type="submit" name="_action_update" value="Update" class="edit" /></span>
			<span class="button"><input type="submit" name="_action_cancel" value="Cancel" class="cancel"/></span>
		</div>           
		
	</g:form>			
</g:if>