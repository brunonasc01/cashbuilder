
<g:javascript>
styleButtons()
</g:javascript>

<g:comboCategorias trigger="comboCategoria" target="comboSubcategorias" action="categoriaMultipleSelected"/>

<g:validateForm controller="meta" form="newGoal" />

<g:form class="modalForm" name="newGoal" controller="meta" action="save">
	<g:hiddenField name="user.id" value="-1"></g:hiddenField>

	<div class="title">
		Nova Meta
	</div>
	
	<div class="inside">
		<div id="field">
			<ul>
				<li class="label">
					<g:message code="meta.nome.label" default="Nome" />
				</li>
				<li class="input">
					<g:textField name="nome" value="${metaInstance?.nome}" />
				</li>
				<li class="message"></li>
			</ul>
		</div>
		
		<div class="clear"></div>
	
		<div id="field">
			<ul>
				<li class="label">
					<g:message code="meta.valorFinal.label" default="Valor Final" />
				</li>
				<li class="input">
					<g:textField name="valorAlmejado" value="${metaInstance?.valorAlmejado}" />
				</li>
				<li class="message"></li>
			</ul>
		</div>
		
		<div class="clear"></div>
		
		<div id="field">
			<ul>
				<li class="label">
					<g:message code="meta.dataInicio.label" default="Data Inicio" />
				</li>
				<li class="input">
					<g:jqDatePicker class="date" name="dataInicio" value="" />
				</li>
				<li class="message"></li>
			</ul>
		</div>
	
		<div class="clear"></div>
	
		<div id="field">
			<ul>
				<li class="label">
					<g:message code="meta.dataFim.label" default="Data Fim" />
				</li>
				<li class="input">
					<g:jqDatePicker class="date" name="dataFim" value="" />
				</li>
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
						 <g:select id="comboCategoria" name="select"
							from="${listCategorias?.categorias}" 
							optionKey="id" value="" noSelection="['': 'Selecione']" />
					</g:if>	
				</li>
				<li class="message"></li>
			</ul>
		</div>
	
		<div class="clear"></div>
	
		<g:set var="counter" value="${0}" />
	
		<ul>
			<li class="label">
				<g:message code="pagamento.subcategoria.label" default="Subcategoria" />
			</li>
			<li class="input">
				<g:if test="${listCategorias}">
					<span id="comboSubcategorias">
					 <g:select name="subcategorias[${counter}].id"
						from="${listCategorias?.subcategorias}" 
						optionKey="id" value="" noSelection="['': 'Selecione']" />
					</span>
				</g:if>
			</li>
			<li class="message"></li>
		</ul>
	
		<div class="clear"></div>
		
		<div id="submitField">
			<ul>
				<li class="button">
					<input type="submit" name="save" value="Gravar"/>
				</li>
				<li class="message"></li>
			</ul>
		</div>
		
		<div class="clear"></div>
	</div>
</g:form>

<r:layoutResources disposition="defer"/>