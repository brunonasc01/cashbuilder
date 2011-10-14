
<%@page import="com.cashbuilder.utils.Constants"%>
<g:if test="${orcamento }">
<div id="orcm-Basic" class="basic">
	<p class="title"> Orçamento ${orcamento.mes} - ${orcamento.ano } </p>

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

				<div id="orcm-item">
					<g:hiddenField name="prevVal" value="${entrada.valorPrevisto }"/>
					<g:hiddenField name="realVal" value="${entrada.valorRealizado }"/>
					
					<div  class="atual span-3">
						<g:formatNumber number="${entrada.valorRealizado }" format="${Constants.FORMATO_MOEDA}"/>
					</div>
					<div class="span-9">
						<div id="progressbar"></div>
					</div>
					<div class="previsto span-3 last">
						<g:formatNumber number="${entrada.valorPrevisto }" format="${Constants.FORMATO_MOEDA}"/>
					</div>
				</div>
			</div>
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
				
				<div id="orcm-item">
					<g:hiddenField name="prevVal" value="${saida.valorPrevisto }"/>
					<g:hiddenField name="realVal" value="${saida.valorRealizado }"/>
				
					<div class="atual span-3">
						<g:formatNumber number="${saida.valorRealizado }" format="${Constants.FORMATO_MOEDA}"/>
					</div>				
					<div class="span-9">
						<div id="progressbar"></div>
					</div>				
					<div class="previsto span-3 last">
						<g:formatNumber number="${saida.valorPrevisto }" format="${Constants.FORMATO_MOEDA}"/>
					</div>
				</div>
			</div>
		</g:each>
	</g:if>
</div>	
</g:if>