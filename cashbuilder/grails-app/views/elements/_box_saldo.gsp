<%@page import="com.cashbuilder.utils.Constants"%>

<div class="box saldo ui-corner-all shadow_box">
	<g:if test="${boxSaldo}">
		<p class="title">Saldo Atual (R$)</p>
		<div class="span-4">
	
		<div class="subtitle span-2">Entradas</div>
		<div class="span-2 positivo last">
			<g:formatNumber number="${boxSaldo.entradas}" currencySymbol="" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
		</div>
				
		<div class="subtitle span-2">Saídas</div>
		<div class="span-2 negativo last">
			<g:formatNumber number="${boxSaldo.saidas}" currencySymbol="" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
		</div>
				
		<g:set var="classSaldo" value="${(boxSaldo.saldo > 0) ? 'positivo' : 'negativo' }"></g:set>
		
		<div class="subtitle span-2">Saldo</div>
		<div class="span-2 ${classSaldo } last">
			<g:formatNumber number="${boxSaldo.saldo}" currencySymbol="" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
		</div>
		</div>
		<div class="span-2 last">
		
		</div>
	</g:if>
</div>