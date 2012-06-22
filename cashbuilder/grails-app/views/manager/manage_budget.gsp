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
    	<g:monthMenu action="manage_budget" month="${monthIndex}" />

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
		           	
		           	<div class="inside applyBox">
		           		<ul>
		           			<li class="label">
		           				Mês (${DateUtils.getMes(budgetMonth.month) })
		           			</li>
		           			<li class="input">
		           				<g:radio name="saveType" value="month" checked="true"></g:radio>
		           			</li>
		           		</ul>
		           		
		           		<hr />
		           		
		           		<ul>
		           			<li class="label">
		           				Ano (${DateUtils.anoAtual })
		           			</li>
		           			<li class="input">
		           				<g:radio name="saveType" value="year" ></g:radio>
		           			</li>
		           		</ul>
		           		
		           		<hr />
		           		
		           		<ul>
		           			<li class="button">
		           				<g:submitButton name="_action_save_budget" class="save" value="Gravar" />
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
			            <g:hasErrors bean="${budgetMonth}">
			            	<div class="error">
			                	<g:renderErrors bean="${budgetMonth}" as="list" />
			            	</div>
			            </g:hasErrors>
					</g:else>
	
					<g:hiddenField name="monthId" value="${budgetMonth.month}"></g:hiddenField>
					<g:hiddenField name="id" value="${budgetMonth.id}"></g:hiddenField>
					<g:set var="counter" value="${0}" />
					<g:set var="totalIncome" value="${0}" />
					
					<div class="title">
						ENTRADAS
					</div>
					
					<div class="inside">
						<g:each var="bean" in="${incomeList}">
							
							<h3>${bean.category }</h3>							

							<g:each var="item" in="${bean.subcategories}">
							
								<ul>
									<li class="label">
										${item.subcategory }
									</li>
									<li class="input">
										<g:textField name="itens[${counter}].budgetedValue" value="${df.format(item?.budgetedValue) }" />
									</li>
								</ul>
								<g:hiddenField name="itens[${counter}].subcategory.id" value="${item?.subcategory.id }"></g:hiddenField>
								<g:hiddenField name="itens[${counter}].category.id" value="${item?.category.id }"></g:hiddenField>
								<g:set var="counter" value="${counter + 1}" />

								<hr />
							</g:each>
						</g:each>
					</div>
	
					<div class="clear"></div>
	
					<div class="title">
						SAIDAS
					</div>
					
					<div class="inside">
						<g:each var="bean" in="${expenseList}">

							<h3>${bean.category }</h3>
		
							<g:each var="item" in="${bean.subcategories}">
								<ul>
									<li class="label">
										${item.subcategory }
									</li>
									<li class="input">
										<g:textField name="itens[${counter}].budgetedValue" value="${df.format(item?.budgetedValue) }" />
									</li>
								</ul>

								<g:hiddenField name="itens[${counter}].subcategory.id" value="${item?.subcategory.id }"></g:hiddenField>
								<g:hiddenField name="itens[${counter}].category.id" value="${item?.category.id }"></g:hiddenField>
								<g:set var="counter" value="${counter + 1}" />

								<hr />
							</g:each>
						</g:each>
					</div>
				</div>
          	</div>
		</g:form>
	</body>		
</html>
