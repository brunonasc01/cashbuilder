
<%@page import="com.cashbuilder.utils.DateUtils"%>
<%@page import="com.cashbuilder.utils.Constants"%>
<g:if test="${orcamento }">
	<table class="orcamento">
		<tbody>
			<tr class="date header">
				<td colspan="3">${DateUtils.getMes(orcamento.mes) } - ${orcamento.ano }</td>
			</tr>
	
			<tr class="titulo header">
				<td width="75">CATEGORIA</td>
				<td width="100">PREVISTO</td>
				<td width="100">REALIZADO</td>
			</tr>
			
			<g:if test="${orcamento.orcmEntradas }">
				<g:each var="entrada" in="${orcamento.orcmEntradas}">
					<tr class="categoria">
						<td class="nome">${entrada.nome }</td>
						<td>
							<g:formatNumber number="${entrada.vlPrevisto }" format="${Constants.FORMATO_MOEDA}"/>
						</td>
						<td>
							<g:formatNumber number="${entrada.vlRealizado }" format="${Constants.FORMATO_MOEDA}"/>
						</td>
					</tr>
					<g:if test="${entrada.subcategorias}">
						<g:each var="subcategoria" in="${entrada.subcategorias}">
							<tr class="subcategoria">
								<td class="nome">${subcategoria.nome }</td>
								<td>
									<g:formatNumber number="${subcategoria.vlPrevisto }" format="${Constants.FORMATO_MOEDA}"/>
								</td>
								<td>
									<g:formatNumber number="${subcategoria.vlRealizado}" format="${Constants.FORMATO_MOEDA}"/>
								</td>
							</tr>
						</g:each>
					</g:if>
				</g:each>
			</g:if>
			
			<g:if test="${orcamento.orcmSaidas }">
				<g:each var="saida" in="${orcamento.orcmSaidas}">
					<tr class="categoria">
						<td class="nome">${saida.nome }</td>
						<td>
							<g:formatNumber number="${saida.vlPrevisto }" format="${Constants.FORMATO_MOEDA}"/>
						</td>
						<td>
							<g:formatNumber number="${saida.vlRealizado }" format="${Constants.FORMATO_MOEDA}"/>
						</td>
					</tr>
					<g:if test="${saida.subcategorias}">
						<g:each var="subcategoria" in="${saida.subcategorias}">
							<tr class="subcategoria">
								<td class="nome">${subcategoria.nome }</td>
								<td>
									<g:formatNumber number="${subcategoria.vlPrevisto}" format="${Constants.FORMATO_MOEDA}"/>
								</td>
								<td>
									<g:formatNumber number="${subcategoria.vlRealizado}" format="${Constants.FORMATO_MOEDA}"/>
								</td>
							</tr>
						</g:each>
					</g:if>
				</g:each>
			</g:if>
		</tbody>
	</table>
</g:if>