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
					
					<div class="span-3">
						<label for="Mes">Mês atual</label>
					</div>			              
					<div class="span-2 last">
						<g:radio name="tipoSave" value="mes" checked="true"></g:radio>
					</div>
					
					<div class="span-3">
						<label for="Ano">Ano</label>
					</div>			              
					<div class="span-2 last">
						<g:radio name="tipoSave" value="ano" ></g:radio>
					</div>

	   				<div class="span-2">
	   					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
	   				</div>
	   			</fieldset>
	   			
	   			<div class="span-6">
					<div class="span-2 prepend-1">
						<label>+ Entradas</label>
					</div>
					<div class="span-2 last">
						${totalEntradas }	
					</div>
					
					<div class="span-2 prepend-1">
						<label>- Saidas</label>
					</div>
					<div class="span-2 last">
						${totalSaidas }	
					</div>
					
					<div class="span-2 prepend-1">
						<label>  Saldo</label>
					</div>
					<div class="span-2 last">
						${saldo }	
					</div>
				</div>
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
					
					<div class="span-16">
						<label>ENTRADAS</label>
					</div>
					
					<g:each var="bean" in="${itensCred}">

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

					<div class="span-16">
						<label>SAIDAS</label>
					</div>
					
					<g:each var="bean" in="${itensDeb}">

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
