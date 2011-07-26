<%@page import="com.cashbuilder.utils.Constants"%>
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
			
            <g:form action="save" >
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
						<label for="valorAlmejado">Valor Desejado</label>
					</div>			              
					<div class="span-6 last">
						<g:textField name="valorAlmejado" value="${metaInstance?.valorAlmejado}" />
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
						<g:if test="${listCategorias}">
							 <g:select
								from="${listCategorias?.categorias}" 
								optionKey="id" value="" noSelection="['': 'Selecione']" />
						</g:if>
					</div>
		
					<g:set var="counter" value="${0}" />
		
					<div class="form-label span-4">
						<label for="subcategoria"><g:message code="pagamento.subcategoria.label" default="Subcategoria" /></label>
					</div>			              
					<div class="span-6 last">
						<g:if test="${listCategorias}">
							 <g:select name="subcategorias[${counter}].id"
								from="${listCategorias?.subcategorias}" 
								optionKey="id" value="" noSelection="['': 'Selecione']" />
						</g:if>
					</div>
					
					<div class="clear"></div>
					
					<div class="span-8 prepend-4 last">
						<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					</div>
          		</fieldset>
            </g:form>
            
            <g:set var="prog" value="${0}" />
            
            <g:if test="${metas }">
            	<g:each var="meta" in="${metas}">
            		<p>${meta.nome }</p>
            		<p>${meta.descricao }</p>            	
            		R$ <g:formatNumber number="${meta.valorAcumulado }" format="${Constants.moneyMask}"></g:formatNumber>
            		
            		<div id="progressbar${prog }"></div>
            		
            		<script type="text/javascript">
					$(function() {
						$( "#progressbar${prog }" ).progressbar({
							value: ${meta.porcentagem}
						});
					});
				</script>
            		
					<g:set var="prog" value="${prog + 1}" />
            	</g:each>
            </g:if>
	  	</div>
	  	</div>
	</body>		
</html>
