<%@page import="com.cashbuilder.DateUtils"%>
<%@page import="com.cashbuilder.Constants"%>

<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta name="layout" content="base" />
		<r:require module="adm"/>        
    </head>
    <body>
   		<g:render template="/elements/area_title" model="[bundle_key: 'form.manager.budget.title',class_icon:'icon-admin']"/>
   		
   		<g:monthMenu action="manage_budget" month="${monthIndex}" nextYear="${nextYear}"/>
   		
   		<g:render template="/elements/message" var="bean" bean="${bean}" ></g:render>

    	<g:form name="budget-data-form">
	    	<div class="col-25">
	    			
	    		<g:set var="month_key" value="month.${budgetMonth.month}" />
	    			    	
	    		<div class="box append-bottom-dist">
	    			<h3 class="title-box">
	    				<g:message code="form.manager.budget.box.title"/>
	    				<g:if test="${!saveYear}">
	    					(<g:message code="${month_key }"/>)
	    				</g:if>
	    			</h3>

		           	<div class="content">
		           		<div id="budget-submit-options" class="content-center">
		           			<g:if test="${saveYear}">
				           		<label><g:message code="month.label"/> (<g:message code="${month_key }"/>)
				           		</label><g:radio name="saveType" value="month" checked="true"></g:radio>
				           		
								<label><g:message code="year.label"/> (${currentYear})
								</label><g:radio name="saveType" value="year" ></g:radio>
	
								<g:actionSubmit action="save_budget" class="btn" value="Gravar"/>
							</g:if>
							<g:else>
								<g:hiddenField name="saveType" value="month"/>
								<g:actionSubmit action="save_budget" class="btn btn-large" value="Gravar Orçamento"/>
							</g:else>
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

					<h3 class="title-box"><g:message code="form.manager.budget.box.label.income"/></h3>

					<div class="content">
						<g:each var="bean" in="${incomeList}">
							<h4><g:customLabel value="${bean.category}" prefix="label"/></h4>

							<div class="budget-item">
								<g:each var="item" in="${bean.subcategories}">
									<label><g:customLabel value="${item.subcategory}" prefix="label"/>
									</label><g:textField name="itens[${counter}].budgetedValue" value="${df.format(item?.budgetedValue) }" />

									<g:hiddenField name="itens[${counter}].subcategory.id" value="${item?.subcategory.id }"></g:hiddenField>
									<g:hiddenField name="itens[${counter}].category.id" value="${item?.category.id }"></g:hiddenField>
									<g:set var="counter" value="${counter + 1}" />
								</g:each>
							</div>
						</g:each>
					</div>

					<h3 class="title-box"><g:message code="form.manager.budget.box.label.expense"/></h3>

					<div class="content">
						<g:each var="bean" in="${expenseList}">
							<h4><g:customLabel value="${bean.category}" prefix="label"/></h4>

							<div class="budget-item">
								<g:each var="item" in="${bean.subcategories}">
									<label><g:customLabel value="${item.subcategory}" prefix="label"/>
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