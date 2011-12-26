
<g:javascript>
$(document).ready(function() {
	ajaxComboSubcategoria("comboCategoria","/cashbuilder/categoria/categoriaSelected","comboSubcategorias");
	
	ajaxValidate("/cashbuilder/pagamento/validator","expressForm",true);
});
</g:javascript>

<div id="lbox">
	<g:form name="expressForm" class="regform" action="save_registro" controller="home">
		<div class="title">
			Registro Rápido
		</div>
		
		<div class="inside">
			<div id="field">
			<div class="form-label span-3">
				<label><g:message code="pagamento.data.label" default="Data" /></label>
			</div>			              
			<div class="form-input span-5 last">
				<g:jqDatePicker class="date" name="data" value="" />
			</div>
			<div class="form-msg-short span-7 append-5 prepend-2">
			</div>
			</div>
	
			<div class="clear"></div>

			<div id="field">
			<div class="form-label span-3">
				<label><g:message code="pagamento.valor.label" default="Valor" /></label>
			</div>			              
			<div class="form-input span-5 last">
				<g:textField maxlength="10" name="valor" value="" />
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
					<g:if test="${registroRapido}">
						 <g:select id="comboCategoria" name="categoria.id"
							from="${registroRapido.categorias}" 
							optionKey="id" value="" noSelection="['': 'Selecione']" />
					</g:if>
				</div>
				<div class="form-msg-short span-7 append-5 prepend-2">
				</div>
			</div>

			<div class="clear"></div>

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
	
			<div class="clear"></div>
		
			<div id="field">
				<div class="form-label span-3">
					<label><g:message code="pagamento.descricao.label" default="Descricao" /></label>
				</div>			              
				<div class="form-input span-7 last">
					<g:textField size="33" maxlength="150" name="descricao" value="" />
				</div>
				<div class="form-msg-short span-7 append-5 prepend-2">
				</div>
			</div>
		
			<div class="clear"></div>
			
			<div id="submitField">
				<div class="span-5 prepend-3">
					<g:submitButton name="gravar" class="save" value="Gravar" />
					<g:submitButton name="limpar" class="reset" type="reset" value="${message(code: 'default.button.clean.label', default: 'Limpar')}" />
				</div>
				<div class="clear"></div>
				<div class='alert-msg span-7 prepend-3 last'></div>
			</div>

		</div>
	</g:form>			
</div>