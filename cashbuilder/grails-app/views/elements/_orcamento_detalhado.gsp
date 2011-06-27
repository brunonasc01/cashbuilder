
<g:if test="${orcamento }">
	<table class="orcamento">
		<tbody>
			<tr class="date header">
				<td>${orcamento.ano }</td>
				<td colspan="2">${orcamento.mes }</td>
			</tr>
	
			<tr class="header">
				<td width="75">CATEGORIA</td>
				<td width="100">PREVISTO</td>
				<td width="100">REALIZADO</td>
			</tr>
			
			<g:if test="${orcamento.orcmEntradas }">
				<g:each var="entrada" in="${orcamento.orcmEntradas}">
					<tr class="categoria">
						<td class="nome">${entrada.nome }</td>
						<td>${entrada.vlPrevisto }</td>
						<td>${entrada.vlRealizado }</td>
					</tr>
					<g:if test="${entrada.subcategorias}">
						<g:each var="subcategoria" in="${entrada.subcategorias}">
							<tr class="subcategoria">
								<td class="nome">${subcategoria.nome }</td>
								<td>${subcategoria.vlPrevisto}</td>
								<td>${subcategoria.vlRealizado}</td>
							</tr>
						</g:each>
					</g:if>
				</g:each>
			</g:if>
			
			<g:if test="${orcamento.orcmSaidas }">
				<g:each var="saida" in="${orcamento.orcmSaidas}">
					<tr class="categoria">
						<td class="nome">${saida.nome }</td>
						<td>${saida.vlPrevisto }</td>
						<td>${saida.vlRealizado }</td>
					</tr>
					<g:if test="${saida.subcategorias}">
						<g:each var="subcategoria" in="${saida.subcategorias}">
							<tr class="subcategoria">
								<td class="nome">${subcategoria.nome }</td>
								<td>${subcategoria.vlPrevisto}</td>
								<td>${subcategoria.vlRealizado}</td>
							</tr>
						</g:each>
					</g:if>
				</g:each>
			</g:if>
		</tbody>
	</table>
</g:if>