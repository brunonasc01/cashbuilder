<link rel="stylesheet" href="${resource(dir:'css/calendar',file:'dhtmlgoodies_calendar.css')}" />
<g:javascript src="dhtmlgoodies_calendar.js" />

	<div class="box_registro">
		<g:form class="regform" action="save_registro" controller="home">
			<fieldset>
	            <legend>Registro Rápido</legend>

				<!-- <input type="button" value="Cal" onclick="displayCalendar(document.forms[0].data,'yyyy/mm/dd hh:ii',this,true)">  -->
				<div class="span-10 append-6">
					<div class="span-2">
						<label for="data"><g:message code="pagamento.data.label" default="Data" /></label>
					</div>			              
					<div class="span-8 last">
						<g:datePicker name="data" value="" />
					</div>
				</div>

				<div class="span-5">
					<div class="span-2">
						<label for="valor"><g:message code="pagamento.valor.label" default="Valor" /></label>
					</div>			              
					<div class="span-3 last">
						<g:textField size="10" maxlength="10" name="valor" value="" />
					</div>
				</div>
					
				<div class="span-5 last append-6">
					<div class="span-2">
						<label for="natureza"><g:message code="pagamento.natureza.label" default="Natureza" /></label>
					</div>
					<div class="span-3 last">
						<g:select name="natureza"
								from="${['D', 'C']}"
								 noSelection="['': 'Selecione']" >
							
						</g:select>
					</div>
				</div>
				
				<div class="span-6">
					<div class="span-2">
						<label for="categoria"><g:message code="pagamento.categoria.label" default="Categoria" /></label>
					</div>			              
					<div class="span-4 last">
						<g:if test="${registroRapido}">
							 <g:select name="categoria.id"
								from="${registroRapido.categorias}" 
								optionKey="id" value="" noSelection="['': 'Selecione']" />
						</g:if>
					</div>
				</div>
				
				<div class="span-6 last append-4">
					<div class="span-3">
						<label for="subcategoria"><g:message code="pagamento.subcategoria.label" default="Subcategoria" /></label>
					</div>			              
					<div class="span-3 last">
						<g:if test="${registroRapido}">
							 <g:select name="subcategoria.id"
								from="${registroRapido.subcategorias}" 
								optionKey="id" value="" noSelection="['': 'Selecione']" />
						</g:if>
					</div>
				</div>
				
				<div class="span-2">
					<label for="descricao"><g:message code="usuario.descricao.label" default="Descricao" /></label>
				</div>			              
				<div class="span-8 last">
					<g:textField size="50" maxlength="150" name="descricao" value="" />
				</div>
				
				<div class="span-5 prepend-7">
					<g:submitButton name="gravar" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					<g:submitButton name="limpar" class="save" value="${message(code: 'default.button.clean.label', default: 'Limpar')}" />
				</div>           
			</fieldset>
        </g:form>			
	</div>