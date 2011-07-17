<g:if test="${fluxoCaixa}">
	<table id="cashflow" class="cashflow">
		<tbody>
			<tr class="header">
				<td></td>
				<td>Dia</td>
				<td>Entrada</td>
				<td>Saída</td>
				<td>Categoria</td>
				<td>Descrição</td>
			</tr>
	
			<g:each var="pg" in="${fluxoCaixa.pagamentos}">
				<tr>
					<td>
		                <g:form controller="pagamento">
		                    <input type="hidden" name="id" value="${pg.id}" id="id" />
		                    <span class="button"><input type="submit" name="_action_edit" value="E" class="edit" /></span>
		                    <span class="button"><input type="submit" name="_action_delete" value="D" class="delete" onclick="return confirm('Tem Certeza?');" /></span>
		                </g:form>
					</td>
					<td><g:formatDate format="dd" date="${pg.data}"></g:formatDate></td>
	
					<td>
						<g:if test="${pg.natureza.equals('C')}">
							${pg.valor}
						</g:if>
						<g:else>
							<g:formatNumber number="0" format="###,###,##0.00"></g:formatNumber>
						</g:else>
					</td>						
	
					<td>
						<g:if test="${pg.natureza.equals('D')}">
						  <g:formatNumber number="${pg.valor}" format="###,###,##0.00"></g:formatNumber>
						</g:if>
						<g:else>
							<g:formatNumber number="0" format="###,###,##0.00"></g:formatNumber>
						</g:else>
					</td>

					<td>${pg.subcategoria}</td>
					
					<td class="descricao">${pg.descricao}</td>
				</tr>
			</g:each>
		</tbody>
	</table>
</g:if>