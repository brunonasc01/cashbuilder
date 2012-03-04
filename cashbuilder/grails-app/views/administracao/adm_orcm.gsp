<%@page import="com.cashbuilder.utils.DateUtils"%>
<%@page import="com.cashbuilder.utils.Constants"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <title>Sistema Grails</title>
        <meta name="layout" content="base" />
		<r:require module="adm"/>        
    </head>
    <body>
    	<g:monthMenu action="adm_orcm" month="${monthIndex}" />

    	<div class="span-24">
			<div id="title">
    			<h3>Orcamento Manual</h3>
    		</div>
    	</div>
    
    	<g:form class="budgetForm">
	    	<div class="span-7">
	    			    	
	    		<div id="lbox">
		   			<div class="title">
		           		Aplicar para
		           	</div>
		           	
		           	<div class="inside">
		           		<ul class="boxes">
		           			<li class="label">
		           				Mês (${DateUtils.getMes(orcmMes.mes) })
		           			</li>
		           			<li class="input">
		           				<g:radio name="tipoSave" value="mes" checked="true"></g:radio>
		           			</li>
		           			<li class="label">
		           				Ano (${DateUtils.anoAtual })
		           			</li>
		           			<li class="input">
		           				<g:radio name="tipoSave" value="ano" ></g:radio>
		           			</li>
		           			
		           			<li class="button">
		           				<g:submitButton name="_action_save_itens" class="save" value="Gravar" />
		           			</li>
		           		</ul>
		           		<div class="clear"></div>
		   			</div>
	   			</div>

	   			<div id="lbox">
	   				<g:render template="/elements/box_saldo" var="bean" bean="${balanceBox }"  ></g:render>
				</div>
	    	</div>
    
		  	<div class="span-17 last">
		  		<div id="rbox">
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
	
					<g:hiddenField name="mesId" value="${orcmMes.mes}"></g:hiddenField>
					<g:hiddenField name="id" value="${orcmMes.id}"></g:hiddenField>
					<g:set var="counter" value="${0}" />
					
					<div class="title">
						ENTRADAS
					</div>
					
					<div class="inside">
						<g:each var="bean" in="${itensCred}">

							<h5>${bean.categoria }</h5>							

							<g:each var="item" in="${bean.subcategorias}">
							
								<ul>
									<li class="label">
										${item.subcategoria }
									</li>
									<li class="input">
										<g:textField name="itens[${counter}].valorPrevisto" value="${df.format(item?.valorPrevisto) }" />
									</li>
								</ul>
								<g:hiddenField name="itens[${counter}].subcategoria.id" value="${item?.subcategoria.id }"></g:hiddenField>
								<g:hiddenField name="itens[${counter}].categoria.id" value="${item?.categoria.id }"></g:hiddenField>
								<g:set var="counter" value="${counter + 1}" />
								<div class="clear"></div>
							</g:each>
						</g:each>
					</div>
	
					<div class="clear"></div>
	
					<div class="title">
						SAIDAS
					</div>
					
					<div class="inside">
						<g:each var="bean" in="${itensDeb}">

							<h5>${bean.categoria }</h5>
		
							<g:each var="item" in="${bean.subcategorias}">
								<ul>
									<li class="label">
										${item.subcategoria }
									</li>
									<li class="input">
										<g:textField name="itens[${counter}].valorPrevisto" value="${df.format(item?.valorPrevisto) }" />
									</li>
								</ul>

								<g:hiddenField name="itens[${counter}].subcategoria.id" value="${item?.subcategoria.id }"></g:hiddenField>
								<g:hiddenField name="itens[${counter}].categoria.id" value="${item?.categoria.id }"></g:hiddenField>
								<g:set var="counter" value="${counter + 1}" />
								<div class="clear"></div>
							</g:each>
						</g:each>
					</div>
				</div>
          	</div>
		</g:form>
	</body>		
</html>
