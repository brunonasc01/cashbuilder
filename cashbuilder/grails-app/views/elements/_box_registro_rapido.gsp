
<g:javascript>
$(document).ready(function() {
	ajaxComboSubcategoria("comboCategoria","/cashbuilder/categoria/categoriaSelected","comboSubcategorias");
	ajaxValidate("/cashbuilder/pagamento/validator","xpNewReg",true);
});
</g:javascript>

<div id="lbox">
	<g:form class="boxForm" name="xpNewReg" action="save_registro" controller="home">
		<div class="title">
			Registro Rápido
		</div>
		
		<div class="inside">
			<ul id="field">
				<li class="label">
					<g:message code="pagamento.data.label" default="Data" />
				</li>
				<li class="input">
					<g:jqDatePicker class="date" name="data" value="" />
				</li>
				<li class="message"></li>
			</ul>

			<div class="clear"></div>

			<ul id="field">
				<li class="label">
					<g:message code="pagamento.valor.label" default="Valor" />
				</li>
				<li class="input">
					<g:textField maxlength="10" name="valor" value="" />
				</li>
				<li class="message"></li>
			</ul>

			<div class="clear"></div>
	
			<ul id="field">
				<li class="label">
					<g:message code="pagamento.categoria.label" default="Categoria" />
				</li>
				<li class="input">
					<g:if test="${registroRapido}">
						 <g:select id="comboCategoria" name="categoria.id"
							from="${registroRapido.categorias}" 
							optionKey="id" value="" noSelection="['': 'Selecione']" />
					</g:if>
				</li>
				<li class="message"></li>
			</ul>

			<div class="clear"></div>

			<ul>
				<li class="label">
					<g:message code="pagamento.subcategoria.label" default="Subcategoria" />
				</li>
				<li class="input">
					<g:if test="${registroRapido}">
						<span id="comboSubcategorias">
						 <g:select name="subcategoria.id"
							noSelection="['': 'Selecione uma categoria']" />
						</span>
					</g:if>
				</li>
				<li class="message"></li>
			</ul>

			<div class="clear"></div>
		
			<ul id="field">
				<li class="label">
					<g:message code="pagamento.descricao.label" default="Descricao" />
				</li>
				<li class="input">
					<g:textArea name="descricao" maxlength="150"></g:textArea>
				</li>
				<li class="message"></li>
			</ul>

			<div class="clear"></div>
						
			<ul id="submitField">
				<li class="button">
					<g:submitButton name="gravar" class="save" value="Gravar" />
					<g:submitButton name="limpar" class="reset" type="reset" value="${message(code: 'default.button.clean.label', default: 'Limpar')}" />
				</li>
				<li class="message"></li>
			</ul>
			
			<div class="clear"></div>
		</div>
	</g:form>			
</div>