<%@ page import="com.cashbuilder.Usuario" %>

<html>
    <head>
        <title>Sistema Grails</title>
        <meta name="layout" content="base" />
        
    </head>
    <body>
	  	<div class="span-24">
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
			
            <g:form method="POST" class="regform" action="save_itens" >
            	<fieldset>
		            <legend>Registro de Orcamento</legend>
		            
		            <div class="span-12 append-10">

						<g:hiddenField name="id" value="${orcmMes.id}"></g:hiddenField>

						<g:each var="item" in="${orcmMes.itens}" status="i">
	
							<div class="span-4">
								<label for="categoria">${item.subcategoria }</label>
							</div>			              
							<div class="span-8 last">
								<g:textField name="itens[${i}].valorPrevisto" value="${item?.valorPrevisto}" />
							</div>
	
							<g:hiddenField name="itens[${i}].subcategoria.id" value="${item?.subcategoria.id }"></g:hiddenField>
							<g:hiddenField name="itens[${i}].categoria.id" value="${item?.categoria.id }"></g:hiddenField>
						</g:each>

						<div class="clear"></div>
						
						<div class="span-8 prepend-4 last">
							<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
						</div>
		            </div>
          		</fieldset>
            </g:form>
	  	</div>
	</body>		
</html>
