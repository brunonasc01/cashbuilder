
<g:comboCategorias trigger="comboCategoria" target="comboSubcategorias"/>
<g:validateForm controller="pagamento" form="xpNewReg" />

<g:javascript>
enableParcels();
</g:javascript>

<div id="lbox">
	<g:form class="boxForm" name="xpNewReg" action="save_registro" controller="home">
		<div class="title">
			Registro Rápido
		</div>

		<g:hiddenField name="natureza" value="D"></g:hiddenField>
		<g:hiddenField name="user.id" value="-1"></g:hiddenField>
		
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
			
			<div id="hidden_element">
				<ul id="field">
					<li class="label">
						<g:message code="pagamento.parcel.label" default="Parcelado ?" />
					</li>
					<li class="composed_input">
						<g:checkBox name="parcel" />
						<small id="parcel_msg">marque para inserir as parcelas</small>
						<g:textField maxlength="2" size="2" name="parcels" value="1" />
					</li>
					<li class="message"></li>
				</ul>
	
				<div class="clear"></div>
			</div>
			
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
						 <g:select name="subcategoria.id" from=""
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