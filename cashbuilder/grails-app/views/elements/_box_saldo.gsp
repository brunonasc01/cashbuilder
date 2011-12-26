<%@page import="com.cashbuilder.utils.Constants"%>

<div id="rbox">
	<div class="title">
		Saldo Atual
	</div>
	<div class="inside">
		<g:if test="${boxSaldo}">
			<ul>
				<li>
					Entradas
					<g:formatNumber number="${boxSaldo.entradas}" currencySymbol="" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
				</li>
				<li>
					Saídas
					<g:formatNumber number="${boxSaldo.saidas}" currencySymbol="" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
				</li>
				<li>	
					<g:set var="classSaldo" value="${(boxSaldo.saldo > 0) ? 'positivo' : 'negativo' }"></g:set>
					Saldo
					<g:formatNumber number="${boxSaldo.saldo}" currencySymbol="" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
				</li>
			</ul>
			
		</g:if>
	</div>
</div>
