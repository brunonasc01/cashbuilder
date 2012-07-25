<%@page import="com.cashbuilder.Constants"%>

	<div class="title">
		<g:message code="${bean.title }"/>
	</div>
	<div id="balanceBox" class="inside">
		<g:if test="${bean}">
			<g:if test="${bean.isBudget }">
				<ul class="simple">
					<li class="label">
						<g:message code="box.balance.planned.label"/>
					</li>
					<li class="value ${bean.plannedClass}">
						<g:formatNumber number="${bean.plannedBalance}" currencySymbol=""
							format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
					</li>
				</ul>
				<ul class="simple">
					<li class="label">
						<g:message code="box.balance.actual.label"/>
					</li>
					<li class="value ${bean.actualClass}">
						<g:formatNumber number="${bean.actualBalance}" currencySymbol=""
							format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
					</li>
				</ul>
			</g:if>
			<g:else>
				<ul>
					<li class="label">
						<g:message code="box.balance.income.label"/>
					</li>
					<li class="value positive">
						<g:formatNumber number="${bean.income}" currencySymbol=""
							format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
					</li>
					<li class="budget-value">
						<g:message code="default.of"/>
						<g:formatNumber number="${bean.plannedIncome}" currencySymbol=""
							format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
					</li>
				</ul>
				
				<div class="clear"></div>
				
				<ul>
					<li class="label">
						<g:message code="box.balance.expense.label"/>
					</li>
					<li class="value negative">
						<g:formatNumber number="${bean.expense}" currencySymbol=""
							format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
					</li>
					<li class="budget-value">
						<g:message code="default.of"/>
						<g:formatNumber number="${bean.plannedExpense}" currencySymbol=""
							format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
					</li>
				</ul>
				
				<div class="clear"></div>
				
				<ul>
					<li class="label">
						<g:message code="box.balance.balance.label"/>
					</li>
					<li class="value ${bean.balanceClass}">
						<g:formatNumber number="${bean.balance}" currencySymbol=""
							 format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
					</li>
				</ul>
			</g:else>
		</g:if>
		<div class="clear"></div>
	</div>

