
<%@page import="com.cashbuilder.utils.DateUtils"%>
<%@page import="com.cashbuilder.utils.Constants"%>
<g:if test="${orcamento }">
<div class="basic">
	<p class="title"> Orçamento ${DateUtils.getMonth(orcamento.mes) } - ${orcamento.ano } </p>

	<g:set var="counter" value="${0}" />

	<g:if test="${orcamento.orcmEntradas }">
		<p class="title">
			ENTRADAS
		</p>
	
		<g:each var="entrada" in="${orcamento.orcmEntradas}">
			<div class="categoria">
				<p class="rotulo">${entrada.nome }</p>

				<div class="btplus span-1">
					+
				</div>
				
				<div class="atual span-3">
					<g:formatNumber number="${entrada.vlRealizado }" format="${Constants.moneyMask}"/>
				</div>
				
				<div class="span-9">
					<div id="progressbar${counter }"></div>
				</div>
				
				<script type="text/javascript">
					$(function() {
						var percent = (${entrada.vlRealizado }/${entrada.vlPrevisto })*100;

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
					<g:formatNumber number="${entrada.vlPrevisto }" format="${Constants.moneyMask}"/>
				</div>
			</div>
			
			<g:set var="counter" value="${counter + 1}" />
		</g:each>
	</g:if>

	<div class="clear">
	</div>

	<g:if test="${orcamento.orcmSaidas }">
		<p class="title">
			SAIDAS
		</p>
	
		<g:each var="saida" in="${orcamento.orcmSaidas}">
			<div class="categoria">
				<p class="rotulo">${saida.nome }</p>
				<div class="btplus span-1">
					+
				</div>
				
				<div class="atual span-3">
					<g:formatNumber number="${saida.vlRealizado }" format="${Constants.moneyMask}"/>
				</div>
				
				<div class="span-9">
					<div id="progressbar${counter }"></div>
				</div>
				
				<script type="text/javascript">
					$(function() {
						var percent = (${saida.vlRealizado }/${saida.vlPrevisto })*100;

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
					<g:formatNumber number="${saida.vlPrevisto }" format="${Constants.moneyMask}"/>
				</div>
			</div>
			
			<g:set var="counter" value="${counter + 1}" />
		</g:each>
	</g:if>
</div>	
</g:if>