<%@page import="com.cashbuilder.utils.DateUtils"%>
<%@page import="com.cashbuilder.utils.Constants"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <title>Sistema Grails</title>
        <meta name="layout" content="base" />
        <link rel="stylesheet" href="<g:createLinkTo dir='css' file='orcm.css'/>" />
    </head>
    <body>
    	<g:form class="regform">
	    	<div class="span-6">
	    		<div class="box ui-corner-all shadow_box">
		    		<fieldset>
		           		<legend>Filtro</legend>

		   				<div class="span-1"><label for="mesId">Mes</label></div>
		   				<div class="span-3 last">
		    				<g:select name="mesId"
								from="${meses}" 
								optionKey="mes" value="${params.mesId}" noSelection="['': 'Sel.']" />
						</div>
		   		
		   				<div class="span-2">
		   					<g:submitButton name="_action_adm_orcm" value="Filtrar"></g:submitButton>
		   				</div>
		   			</fieldset>
	   			</div>
	    	
	    		<div class="box ui-corner-all shadow_box">
		   			<fieldset>
		           		<legend>Aplicar para</legend>
						
						<div class="span-3"><label for="Mes">Mês (${DateUtils.getMes(orcmMes.mes) })</label></div>
						<div class="span-1 last"><g:radio name="tipoSave" value="mes" checked="true"></g:radio></div>
						
						<div class="span-3"><label for="Ano">Ano</label></div>
						<div class="span-1 last"><g:radio name="tipoSave" value="ano" ></g:radio></div>
	
		   				<div class="span-2 prepend-1">
		   					<g:submitButton name="_action_save_itens" class="save"
		   						 value="${message(code: 'default.button.create.label', default: 'Create')}" />
		   				</div>
		   			</fieldset>
	   			</div>
	   			<g:if test="${orcmBox }">
		   			<div class="box saldo-adm ui-corner-all shadow_box">
		   				<h5>Totais Previstos (R$)</h5>

						<div class="span-2 prepend-1"><label>Entradas</label></div>
						<div class="span-2 positivo last">
							<g:formatNumber number="${orcmBox.entradas}" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
						</div>
						
						<div class="span-2 prepend-1"><label>Saidas</label></div>
						<div class="span-2 negativo last">
							<g:formatNumber number="${orcmBox.saidas}" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
						</div>
						
						<div class="span-2 prepend-1"><label>Saldo</label></div>
						<div class="span-2 last">
							<g:formatNumber number="${orcmBox.saldo}" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
						</div>
					</div>
				</g:if>
	    	</div>
    
		  	<div class="box ui-corner-all span-16 last shadow_box">
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

				<g:hiddenField name="id" value="${orcmMes.id}"></g:hiddenField>
				<g:set var="counter" value="${0}" />
				
				<div class="title-natureza span-15">
					<label>ENTRADAS</label>
				</div>
				
				<g:each var="bean" in="${itensCred}">

					<div class="title-categoria span-6 append-9">
						<label for="categoria">${bean.categoria }</label>
					</div>

					<g:each var="item" in="${bean.subcategorias}">
						<div class="form-label span-4">
							<label for="categoria">${item.subcategoria }</label>
						</div>			              
						<div class="span-4 append-7 last">
							<g:textField name="itens[${counter}].valorPrevisto" value="${df.format(item?.valorPrevisto) }" />
						</div>

						<g:hiddenField name="itens[${counter}].subcategoria.id" value="${item?.subcategoria.id }"></g:hiddenField>
						<g:hiddenField name="itens[${counter}].categoria.id" value="${item?.categoria.id }"></g:hiddenField>
						<g:set var="counter" value="${counter + 1}" />
						<div class="clear"></div>
					</g:each>
				</g:each>

				<hr class="space" />

				<div class="title-natureza span-15">
					<label>SAIDAS</label>
				</div>
				
				<g:each var="bean" in="${itensDeb}">

					<div class="title-categoria span-6 append-9">
						<label for="categoria">${bean.categoria }</label>
					</div>

					<g:each var="item" in="${bean.subcategorias}">
						<div class="form-label span-4">
							<label for="categoria">${item.subcategoria }</label>
						</div>			              
						<div class="span-4 append-7 last">
							<g:textField name="itens[${counter}].valorPrevisto" value="${df.format(item?.valorPrevisto) }" />
						</div>

						<g:hiddenField name="itens[${counter}].subcategoria.id" value="${item?.subcategoria.id }"></g:hiddenField>
						<g:hiddenField name="itens[${counter}].categoria.id" value="${item?.categoria.id }"></g:hiddenField>
						<g:set var="counter" value="${counter + 1}" />
						<div class="clear"></div>
					</g:each>
				</g:each>
          	</div>
		</g:form>
	</body>		
</html>
