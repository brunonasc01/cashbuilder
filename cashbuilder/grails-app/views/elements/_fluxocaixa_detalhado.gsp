<%@page import="com.cashbuilder.Constants"%>

<g:if test="${cashFlow.transactions}">
	<r:script disposition="head">
	$(function() {
		ajaxSubmitToModal('editButton','dialog','edit');
	});
	</r:script>

  	<div id="rbox">
  		<div class="cashflow">
	  		<ul class="legend rounded-top">
				<li class="buttons rounded-left">
				&nbsp
				</li>
				<li class="day">
					<g:message code="cashflow.day.title"/>
				</li>
				<li class="income">
					<g:message code="cashflow.income.title"/>
				</li>
				<li class="expense">
					<g:message code="cashflow.expense.title"/>
				</li>
				<li class="category">
					<g:message code="cashflow.category.title"/>
				</li>
				<li class="description rounded-right">
					<g:message code="cashflow.description.title"/>
				</li>
			</ul>
	  	</div>

		<div class="inside cashflow">
			
			<g:each var="transaction" in="${cashFlow.transactions}" status="counter">
				<ul class="${counter == cashFlow.transactions.size() - 1? 'last rounded-bottom' : ''  }">
					<li class="buttons">
						 <g:form name="formEdit" controller="transaction">
		                    <g:hiddenField name="id" value="${transaction.id}" />
		                    <g:submitButton name="editButton" class="bt_edit" value="" title="editar"/>
		                    <input type="submit" name="_action_delete" class="bt_delete" value="" title="excluir" onclick="return confirm('Tem Certeza?');" />
		                </g:form>
					</li>
					<li class="day">
						<g:formatDate format="dd" date="${transaction.date}"></g:formatDate>
					</li>
					<li class="income">
						<g:if test="${transaction.nature.equals('C')}">
							<g:formatNumber number="${transaction.value}" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
						</g:if>
						<g:else>
							<g:formatNumber number="${0 }" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
						</g:else>
					</li>
					<li class="expense">
						<g:if test="${transaction.nature.equals('D')}">
						  <g:formatNumber number="${transaction.value}" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
						</g:if>
						<g:else>
							<g:formatNumber number="${0 }" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
						</g:else>
					</li>
					<li class="category">
						${transaction.subcategory}
					</li>
					<li class="description">
						${transaction.description}
					</li>
				</ul>
			</g:each>
			
			<div class="clear"></div>
		</div>
	</div>
</g:if>
<g:else>
	<div id="rbox">
		<div class="empty-box">
			<g:message code="cashflow.empty.message"/>
		</div>
	</div>
</g:else>

