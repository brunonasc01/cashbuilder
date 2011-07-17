<html>
    <head>
        <title>Sistema Grails</title>
        <meta name="layout" content="base" />
    </head>

    <body>
	  	<div class="span-6">
	  		<div class="box ui-corner-all shadow_box">
	  		
	  		</div>
	  	</div>
	  	
	  	<div class="box ui-corner-all span-16 last shadow_box">
	  		<div class="span-12 append-10">
	  		<g:if test="${flash.message}">
				<div class="notice">
					${flash.message}
				</div>
			</g:if>
	  		<g:else>
	            <g:hasErrors bean="${metaInstance}">
	            	<div class="error">
	                	<g:renderErrors bean="${metaInstance}" as="list" />
	            	</div>
	            </g:hasErrors>
			</g:else>
			
            <g:form action="save_reg" >
            	<fieldset>
		            <legend>Registro de Meta</legend>

					<div class="form-label span-4">
						<label for="nome">Nome</label>
					</div>			              
					<div class="span-6 last">
						<g:textField name="nome" value="${metaInstance?.nome}" />
					</div>
					
					<div class="clear"></div>
		            			            
		            <div class="form-label span-4">
						<label for="descricao">Descricao</label>
					</div>			              
					<div class="span-6 last">
						<g:textField name="descricao" value="${metaInstance?.descricao}" />
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
						<g:if test="${categorias}">
							 <g:select name="categoria.id"
								from="${categorias}" 
								optionKey="id" value="" noSelection="['': 'Selecione']" />
						</g:if>
					</div>
		
					<div class="form-label span-4">
						<label for="subcategoria"><g:message code="pagamento.subcategoria.label" default="Subcategoria" /></label>
					</div>			              
					<div class="span-5 append-6 last">
						<g:if test="${metaInstance}">
							 <g:select name="subcategoria.id"
								from="${metaInstance.subcategorias}" 
								optionKey="id" value="" noSelection="['': 'Selecione']" />
						</g:if>
					</div>
					
					<div class="clear"></div>
					
					<div class="span-8 prepend-4 last">
						<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					</div>
          		</fieldset>
            </g:form>
	  	</div>
	  	</div>
	</body>		
</html>
