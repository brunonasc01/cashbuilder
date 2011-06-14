<%@ page import="com.cashbuilder.Usuario" %>

<html>
    <head>
        <title>Sistema Grails</title>
        <meta name="layout" content="base" />
        
    </head>
    <body>
    	<g:form method="POST" class="regform" action="save_itens" >
	    	<div class="span-6">
	   			<fieldset>
	           		<legend>Aplicar para</legend>

					<div class="span-2">
						<label for="Ano">Ano</label>
					</div>			              
					<div class="span-2 last">
						<g:radio name="tipoSave" value="ano" checked="true"></g:radio>
					</div>

					<div class="span-2">
						<label for="Mes">Mês atual</label>
					</div>			              
					<div class="span-2 last">
						<g:radio name="tipoSave" value="mes"></g:radio>
					</div>

	   				<div class="span-2">
	   					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
	   				</div>
	   			</fieldset>
	    	</div>
    
		  	<div class="span-18 last">
		  		<g:if test="${flash.message}">
					<div class="notice">
						${flash.message}
					</div>
				</g:if>
		  		<g:else>
		            <g:hasErrors bean="${orcmMes}">
		            	<div class="error">
		                	<g:renderErrors bean="${orcmMes}" as="list" />
		            	</div>
		            </g:hasErrors>
				</g:else>

            	<fieldset>
		            <legend>Registro de Orcamento</legend>

					<g:hiddenField name="id" value="${orcmMes.id}"></g:hiddenField>
					<g:set var="counter" value="${0}" />
					
					<g:each var="bean" in="${orcmItens}">

						<div class="span-16">
							<label for="categoria">${bean.categoria }</label>
							<hr />
						</div>

						<g:each var="item" in="${bean.subcategorias}">
							<div class="span-4 prepend-1">
								<label for="categoria">${item.subcategoria }</label>
							</div>			              
							<div class="span-11 last">
								<g:textField name="itens[${counter}].valorPrevisto" value="${item?.valorPrevisto}" />
							</div>
	
							<g:hiddenField name="itens[${counter}].subcategoria.id" value="${item?.subcategoria.id }"></g:hiddenField>
							<g:hiddenField name="itens[${counter}].categoria.id" value="${item?.categoria.id }"></g:hiddenField>
							<g:set var="counter" value="${counter + 1}" />
							<div class="clear"></div>
						</g:each>
					</g:each>
          		</fieldset>
          	</div>
		</g:form>
	</body>		
</html>
