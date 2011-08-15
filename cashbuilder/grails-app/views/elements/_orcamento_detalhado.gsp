
<%@page import="com.cashbuilder.utils.Constants"%>
<g:if test="${orcamento }">
	<table class="orcamento">
		<tbody>
			<tr class="date header">
				<td colspan="3">${orcamento.mes} - ${orcamento.ano }</td>
			</tr>
	
			<tr class="titulo header">
				<td width="75">CATEGORIA</td>
				<td width="100">PREVISTO</td>
				<td width="100">REALIZADO</td>
			</tr>
			
			<g:if test="${orcamento.listaCredito }">
				<g:each var="entrada" in="${orcamento.listaCredito}">
					<tr class="categoria">
						<td class="nome">${entrada.nome }</td>
						<td>
							<g:formatNumber number="${entrada.valorPrevisto }" format="${Constants.FORMATO_MOEDA}"/>
						</td>
						<td>
							<g:formatNumber number="${entrada.valorRealizado }" format="${Constants.FORMATO_MOEDA}"/>
						</td>
					</tr>
					<g:if test="${entrada.subcategorias}">
						<g:each var="subcategoria" in="${entrada.subcategorias}">
							<tr class="subcategoria">
								<td class="nome">${subcategoria.nome }</td>
								<td>
									<g:formatNumber number="${subcategoria.valorPrevisto }" format="${Constants.FORMATO_MOEDA}"/>
								</td>
								<td>
									<g:formatNumber number="${subcategoria.valorRealizado}" format="${Constants.FORMATO_MOEDA}"/>
								</td>
							</tr>
						</g:each>
					</g:if>
				</g:each>
			</g:if>
			
			<g:if test="${orcamento.listaDebito }">
				<g:each var="saida" in="${orcamento.listaDebito}">
					<tr class="categoria">
						<td class="nome">${saida.nome }</td>
						<td>
							<g:formatNumber number="${saida.valorPrevisto }" format="${Constants.FORMATO_MOEDA}"/>
						</td>
						<td>
							<g:formatNumber number="${saida.valorRealizado }" format="${Constants.FORMATO_MOEDA}"/>
						</td>
					</tr>
					<g:if test="${saida.subcategorias}">
						<g:each var="subcategoria" in="${saida.subcategorias}">
							<tr class="subcategoria">
								<td class="nome">${subcategoria.nome }</td>
								<td>
									<g:formatNumber number="${subcategoria.valorPrevisto}" format="${Constants.FORMATO_MOEDA}"/>
								</td>
								<td>
									<g:formatNumber number="${subcategoria.valorRealizado}" format="${Constants.FORMATO_MOEDA}"/>
								</td>
							</tr>
						</g:each>
					</g:if>
				</g:each>
			</g:if>
		</tbody>
	</table>
</g:if>