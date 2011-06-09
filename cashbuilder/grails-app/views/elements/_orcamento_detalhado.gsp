
<g:if test="${orcamento }">
	<table class="tableOrcm">
		<tr class="date">
			<td>
				${orcamento.ano }
			</td>
			
			<td colspan="2">
				${orcamento.mes }
			</td>
		</tr>

		<tr class="header">
			<td class="header_categoria">
			CATEGORIA
			</td>
	
			<td>PREVISTO</td>
			<td>REALIZADO</td>
		</tr>
		
		<g:if test="${orcamento.orcmEntradas }">
			<g:each var="entrada" in="${orcamento.orcmEntradas}">
				<tr class="categoria_cred">
					<td>
						${entrada.nome }
					</td>
			
					<td class="dado">${entrada.vlPrevisto }</td>
					<td class="dado">${entrada.vlRealizado }</td>
				</tr>
				<g:if test="${entrada.subcategorias}">
					<g:each var="subcategoria" in="${entrada.subcategorias}">
						<tr class="subcategoria_cred">
							<td class="subcategoria">
								${subcategoria.nome }
							</td>
					
							<td class="dado">${subcategoria.vlPrevisto}</td>
							<td class="dado">${subcategoria.vlRealizado}</td>
						</tr>
					</g:each>
				</g:if>
			</g:each>
		</g:if>
		
		<g:if test="${orcamento.orcmSaidas }">
			<g:each var="saida" in="${orcamento.orcmSaidas}">
				<tr class="categoria">
					<td>
						${saida.nome }
					</td>
			
					<td class="dado">${saida.vlPrevisto }</td>
					<td class="dado">${saida.vlRealizado }</td>
				</tr>
				<g:if test="${saida.subcategorias}">
					<g:each var="subcategoria" in="${saida.subcategorias}">
						<tr class="subcategoria">
							<td class="subcategoria">
								${subcategoria.nome }
							</td>
					
							<td class="dado">${subcategoria.vlPrevisto}</td>
							<td class="dado">${subcategoria.vlRealizado}</td>
						</tr>
					</g:each>
				</g:if>
			</g:each>
		</g:if>
	</table>
</g:if>