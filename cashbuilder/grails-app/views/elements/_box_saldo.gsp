<%@page import="com.cashbuilder.utils.Constants"%>

	<div class="title">
		Orcamento Atual		
	</div>
	<div id="balanceBox" class="inside">
		<g:if test="${bean}">
			<g:if test="${bean.isBudget }">
				<ul class="simple">
					<li class="label">
						Previsto
					</li>
					<li class="value ${bean.plannedClass}">
						<g:formatNumber number="${bean.plannedBalance}" currencySymbol=""
							format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
					</li>
				</ul>
				<ul class="simple">
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
					<li class="budget-value">
						2000
					</li>
				</ul>
				
				<div class="clear"></div>
				
				<ul>
					<li class="label">
						Saidas
					</li>
					<li class="value negative">
						<g:formatNumber number="${bean.expense}" currencySymbol=""
							format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
					</li>
					<li class="budget-value">
						de 2.000,00
					</li>
				</ul>
				
				<ul>
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

