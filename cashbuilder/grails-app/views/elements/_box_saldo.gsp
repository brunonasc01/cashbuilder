<%@page import="com.cashbuilder.Constants"%>

<div class="box">
	<h3 class="title-box"><g:message code="${bean.title }"/></h3>

	<g:if test="${bean.isBudget }">
		<div id="cashflow-box" class="content">
			<ul class="inline">
				<li class="title">
					<g:message code="box.balance.planned.label"/>
				</li>
				<li class="value ${bean.plannedClass}">
					 <g:formatNumber number="${bean.plannedBalance}" currencySymbol=""
							format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
				</li>
			</ul>

			<ul class="inline">
				<li class="title">
					<g:message code="box.balance.actual.label"/>
				</li>
				<li class="value ${bean.actualClass}">
					<g:formatNumber number="${bean.actualBalance}" currencySymbol=""
							format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
				</li>
			</ul>
		</div>
	</g:if>
	<g:else>
		<div id="cashflow-box" class="content">
			<ul class="inline">
				<li class="title">
					<g:message code="box.balance.income.label"/>
				</li>
				<li class="value positive">
					 <g:formatNumber number="${bean.income}" currencySymbol=""
							format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
				</li>
			</ul>

			<ul class="inline">
				<li class="title">
					<g:message code="box.balance.expense.label"/>
				</li>
				<li class="value negative">
					 <g:formatNumber number="${bean.expense}" currencySymbol=""
							format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
				</li>
			</ul>

			<ul class="inline">
				<li class="title">
					<g:message code="box.balance.balance.label"/>
				</li>
				<li class="value">
					 <g:formatNumber number="${bean.balance}" currencySymbol=""
							 format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
				</li>
			</ul>
		</div>
	</g:else>	
</div>