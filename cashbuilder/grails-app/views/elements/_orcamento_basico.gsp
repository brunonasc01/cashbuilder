
<%@page import="com.cashbuilder.utils.Constants"%>
<g:if test="${orcamento }">
<div class="basic">
	<p class="title"> Orçamento ${orcamento.mes} - ${orcamento.ano } </p>

	<g:set var="counter" value="${0}" />

	<g:if test="${orcamento.listaCredito }">
		<p class="title">
			ENTRADAS
		</p>
	
		<g:each var="entrada" in="${orcamento.listaCredito}">
			<div class="categoria">
				<p class="rotulo">${entrada.nome }</p>

				<div class="btplus span-1">
					+
				</div>
				
				<div class="atual span-3">
					<g:formatNumber number="${entrada.valorRealizado }" format="${Constants.FORMATO_MOEDA}"/>
				</div>
				
				<div class="span-9">
					<div id="progressbar${counter }"></div>
				</div>
				
				<script type="text/javascript">
					$(function() {
						var percent = (${entrada.porcentagem});

						var pGress = setInterval(function() {
							var pVal = $('#progressbar${counter }').progressbar('option', 'value');
							var pCnt = !isNaN(pVal) ? (pVal + 2) : 0; 
							if (pCnt > percent) {
								clearInterval(pGress); 
							} else {
								$('#progressbar${counter }').progressbar({value: pCnt});
							}
						},percent); 
					});
				</script>
				
				<div class="previsto span-3 last">
					<g:formatNumber number="${entrada.valorPrevisto }" format="${Constants.FORMATO_MOEDA}"/>
				</div>
			</div>
			
			<g:set var="counter" value="${counter + 1}" />
		</g:each>
	</g:if>

	<div class="clear">
	</div>

	<g:if test="${orcamento.listaDebito }">
		<p class="title">
			SAIDAS
		</p>
	
		<g:each var="saida" in="${orcamento.listaDebito}">
			<div class="categoria">
				<p class="rotulo">${saida.nome }</p>
				<div class="btplus span-1">
					+
				</div>
				
				<div class="atual span-3">
					<g:formatNumber number="${saida.valorRealizado }" format="${Constants.FORMATO_MOEDA}"/>
				</div>
				
				<div class="span-9">
					<div id="progressbar${counter }"></div>
				</div>
				
				<script type="text/javascript">
					$(function() {
						var percent = (${saida.porcentagem});

						var pGress = setInterval(function() {
							var pVal = $('#progressbar${counter }').progressbar('option', 'value');
							var pCnt = !isNaN(pVal) ? (pVal + 2) : 0; 
							if (pCnt > percent) {
								clearInterval(pGress); 
							} else {
								$('#progressbar${counter }').progressbar({value: pCnt});
							}
						},percent); 
					});
				</script>
				
				<div class="previsto span-3 last">
					<g:formatNumber number="${saida.valorPrevisto }" format="${Constants.FORMATO_MOEDA}"/>
				</div>
			</div>
			
			<g:set var="counter" value="${counter + 1}" />
		</g:each>
	</g:if>
</div>	
</g:if>