<%@page import="com.cashbuilder.utils.Constants"%>

<div id="rbox">
	<div class="title">
		Saldo Atual
	</div>
	<div id="balanceBox" class="inside">
		<g:if test="${boxSaldo}">
			<ul>
				<li class="label">
					Entradas
				</li>
				<li class="value">
					<span class="positive">
						<g:formatNumber number="${boxSaldo.entradas}" currencySymbol=""
							format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
					</span>					
				</li>
				<li class="label">
					Saídas
				</li>
				<li class="value">
					<span class="negative">
						<g:formatNumber number="${boxSaldo.saidas}" currencySymbol=""
							format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
					</span>
				</li>
				<li class="label">
					<g:set var="classSaldo" value="${(boxSaldo.saldo >= 0) ? 'positive' : 'negative' }"></g:set>
					Saldo
				</li>
				<li class="value">
					<span class="${classSaldo }">
						<g:formatNumber number="${boxSaldo.saldo}" currencySymbol=""
							 format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
					</span>
				</li>
			</ul>
			
		</g:if>
		<div class="clear"></div>
	</div>
</div>
