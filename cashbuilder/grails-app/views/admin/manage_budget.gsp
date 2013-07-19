<%@page import="com.cashbuilder.DateUtils"%>
<%@page import="com.cashbuilder.Constants"%>

<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta name="layout" content="base" />
		<r:require module="adm"/>        
    </head>
    <body>
    	<g:monthMenu action="manage_budget" month="${monthIndex}" nextYear="${nextYear}"/>
    	
   		<g:render template="/elements/area_title" model="[bundle_key: 'manager.budget.title.label']"/>
   		
   		<g:render template="/elements/message" var="bean" bean="${bean}" ></g:render>

    	<g:form name="budget-data-form">
	    	<div class="col-25">
	    			    	
	    		<div class="box append-bottom-dist">
	    			<h3 class="title-box"><g:message code="manager.budget.box.title.label"/></h3>
		           	
		           	<g:set var="month_key" value="${DateUtils.getMonth(budgetMonth.month)}" />
		           	
		           	<div class="content">
		           		<div id="budget-submit-options" class="content-center">
			           		<label><g:message code="month.label"/> (<g:message code="${month_key }"/>)
			           		</label><g:radio name="saveType" value="month" checked="true"></g:radio>
			           		
							<label><g:message code="year.label"/> (${currentYear})
							</label><g:radio name="saveType" value="year" ></g:radio>

	           				<g:submitButton name="_action_save_budget" class="btn" value="Gravar" />
	           			</div>
		   			</div>
	   			</div>

	   			<div class="box">
	   				<g:render template="/elements/box_saldo" var="bean" bean="${balanceBox }"  ></g:render>
				</div>
	    	</div>
    
		  	<div class="col-66 last">
		  		<div class="box">
					<g:hiddenField name="monthId" value="${budgetMonth.month}"></g:hiddenField>
					<g:hiddenField name="id" value="${budgetMonth.id}"></g:hiddenField>
					<g:set var="counter" value="${0}" />
					<g:set var="totalIncome" value="${0}" />
					
					<h3 class="title-box"><g:message code="manager.budget.income.label"/></h3>
										
					<div class="content">
						<g:each var="bean" in="${incomeList}">
							
							<h4>${bean.category }</h4>

							<g:each var="item" in="${bean.subcategories}">
								
								<label>${item.subcategory }
								</label><g:textField name="itens[${counter}].budgetedValue" value="${df.format(item?.budgetedValue) }" />

								<g:hiddenField name="itens[${counter}].subcategory.id" value="${item?.subcategory.id }"></g:hiddenField>
								<g:hiddenField name="itens[${counter}].category.id" value="${item?.category.id }"></g:hiddenField>
								<g:set var="counter" value="${counter + 1}" />
							</g:each>
						</g:each>
					</div>

					<h3 class="title-box"><g:message code="manager.budget.expense.label"/></h3>

					<div class="content">
						<g:each var="bean" in="${expenseList}">
							
							<div class="budget-item">
								<h4>${bean.category }</h4>
			
								<g:each var="item" in="${bean.subcategories}">
									<label>${item.subcategory }
									</label><g:textField name="itens[${counter}].budgetedValue" value="${df.format(item?.budgetedValue) }" />

									<g:hiddenField name="itens[${counter}].subcategory.id" value="${item?.subcategory.id }"></g:hiddenField>
									<g:hiddenField name="itens[${counter}].category.id" value="${item?.category.id }"></g:hiddenField>
									<g:set var="counter" value="${counter + 1}" />
								</g:each>
							</div>
						</g:each>
					</div>
				</div>
          	</div>
		</g:form>
	</body>		
</html>
