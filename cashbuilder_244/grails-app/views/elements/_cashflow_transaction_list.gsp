<%@page import="com.cashbuilder.Constants"%>

<g:if test="${cashFlow.transactions}">
 	<div id="cashflow-table">
  		<ul class="inline title-box text-center">
			<li class="day"><g:message code="cashflow.day.title"/>
			</li><li class="income"><g:message code="cashflow.income.title"/>
			</li><li class="expense"><g:message code="cashflow.expense.title"/>
			</li><li class="category"><g:message code="cashflow.category.title"/>
			</li><li class="description"><g:message code="cashflow.description.title"/></li>
		</ul>
		
		<div class="content text-center">
			<g:each var="transaction" in="${cashFlow.transactions}" status="counter">
				<ul class="inline">
					<li class="buttons">
						<g:if test="${!consult_mode }">
							 <g:form name="editTransactionForm" action="edit" controller="transaction">
			                    <g:hiddenField name="id" value="${transaction.id}" />
			                    <a class="bt-icon icon-edit"></a>
			                </g:form>
			                <g:form action="delete" controller="transaction">
			                    <g:hiddenField name="id" value="${transaction.id}" />
			                    <a class="bt-icon icon-delete"></a>
			                </g:form>
		               	</g:if>
					</li><li class="day"><g:formatDate format="dd" date="${transaction.date}"></g:formatDate>
					</li><li class="income">
						<g:if test="${transaction.nature.equals('C')}">
							<g:formatNumber number="${transaction.value}" format="${Constants.FORMATO_MOEDA}" currencySymbol=""></g:formatNumber>
						</g:if>
						<g:else>
							<g:formatNumber number="${0 }" format="${Constants.FORMATO_MOEDA}" currencySymbol=""></g:formatNumber>
						</g:else>
					</li><li class="expense">
						<g:if test="${transaction.nature.equals('D')}">
						  <g:formatNumber number="${transaction.value}" format="${Constants.FORMATO_MOEDA}" currencySymbol=""></g:formatNumber>
						</g:if>
						<g:else>
							<g:formatNumber number="${0 }" format="${Constants.FORMATO_MOEDA}" currencySymbol=""></g:formatNumber>
						</g:else>
					</li><li class="category"><g:customLabel value="${transaction.subcategory}" prefix="label"/> 
					</li><li class="description">${transaction.description}</li>
				</ul>
			</g:each>
		</div>
  	</div>
</g:if>
<g:else>
	<div class="box">
		<div class="content">
			<g:message code="cashflow.empty.message"/>
		</div>
	</div>
</g:else>

