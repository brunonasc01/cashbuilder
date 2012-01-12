<%@page import="com.cashbuilder.utils.Constants"%>

	<div class="title">
		<g:message code="${bean.title }" default="Saldo" />		
	</div>
	<div id="balanceBox" class="inside">
		<g:if test="${bean}">
			<g:if test="${bean.isBudget }">
				<ul>
					<li class="label">
						Previsto
					</li>
					<li class="value ${bean.plannedClass}">
						<g:formatNumber number="${bean.plannedBalance}" currencySymbol=""
							format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
					</li>
					<li class="label">
						Realizado
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
						Entradas
					</li>
					<li class="value positive">
						<g:formatNumber number="${bean.income}" currencySymbol=""
							format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
					</li>
					<li class="label">
						Saídas
					</li>
					<li class="value negative">
						<g:formatNumber number="${bean.expense}" currencySymbol=""
							format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
					</li>
					<li class="label">
						Saldo
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

