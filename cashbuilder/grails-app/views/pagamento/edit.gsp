<g:if test="${pagamento }">
	<g:form class="regform" controller="pagamento">
		<g:hiddenField name="id" value="${pagamento?.id}" />
		<g:hiddenField name="version" value="${pagamento?.version}" />
	
		<fieldset>
            <legend>Editar Registro</legend>

			<div class="span-10 append-6">
				<div class="span-2">
					<label for="data"><g:message code="pagamento.data.label" default="Data" /></label>
				</div>			              
				<div class="span-8 last">
					<g:datePicker name="data" value="${pagamento?.data }" />
				</div>
			</div>

			<div class="span-5">
				<div class="span-2">
					<label for="valor"><g:message code="pagamento.valor.label" default="Valor" /></label>
				</div>			              
				<div class="span-3 last">
					<g:textField size="10" maxlength="10" name="valor" value="${pagamento?.valor }" />
				</div>
			</div>
				
			<div class="span-5 last append-6">
				<div class="span-2">
					<label for="natureza"><g:message code="pagamento.natureza.label" default="Natureza" /></label>
				</div>
				<div class="span-3 last">
					<g:select name="natureza" from="${['D', 'C']}" noSelection="['': 'Selecione']"
						value="${pagamento?.natureza }" >
						
					</g:select>
				</div>
			</div>
			
			<div class="span-6">
				<div class="span-2">
					<label for="categoria"><g:message code="pagamento.categoria.label" default="Categoria" /></label>
				</div>			              
				<div class="span-4 last">
					<g:if test="${listCategorias}">
						 <g:select name="categoria.id"
							from="${listCategorias.categorias}" 
							optionKey="id" value="${pagamento?.categoria.id}" noSelection="['': 'Selecione']" />
					</g:if>
				</div>
			</div>
			
			<div class="span-6 last append-4">
				<div class="span-3">
					<label for="subcategoria"><g:message code="pagamento.subcategoria.label" default="Subcategoria" /></label>
				</div>			              
				<div class="span-3 last">
					<g:if test="${listCategorias}">
						 <g:select name="subcategoria.id"
							from="${listCategorias.subcategorias}" 
							optionKey="id" value="${pagamento?.subcategoria.id }" noSelection="['': 'Selecione']" />
					</g:if>
				</div>
			</div>
			
			<div class="span-2">
				<label for="descricao"><g:message code="usuario.descricao.label" default="Descricao" /></label>
			</div>			              
			<div class="span-8 last">
				<g:textField size="50" maxlength="150" name="descricao" value="${pagamento?.descricao }" />
			</div>
			
			<div class="span-5 prepend-7">
				<span class="button"><input type="submit" name="_action_update" value="Update" class="edit" /></span>
				<span class="button"><input type="submit" name="_action_cancel" value="Cancel" class="cancel" onclick="return confirm('Tem Certeza?');" /></span>
			</div>           
		</fieldset>
	</g:form>			
</g:if>