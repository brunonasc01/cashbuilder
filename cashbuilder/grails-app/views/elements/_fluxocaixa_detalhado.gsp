<g:if test="${fluxoCaixa}">
	<table class="tableOrcm">
		<tr class="date">
			<td></td>
			<td>Data</td>
			<td>Entrada</td>
			<td>Saída</td>
			<td>Saldo</td>
			<td>Categoria</td>
			<td>Descrição</td>
		</tr>

		<g:each var="pg" in="${fluxoCaixa.pagamentos}">
			<tr>
				<td>
	                <g:form controller="pagamento">
	                    <input type="hidden" name="id" value="${pg.id}" id="id" />
	                    <span class="button"><input type="submit" name="_action_edit" value="Edit" class="edit" /></span>
	                    <span class="button"><input type="submit" name="_action_delete" value="Delete" class="delete" onclick="return confirm('Tem Certeza?');" /></span>
	                </g:form>
				</td>
				<td class="dado">${pg.data}</td>

				<td class="dado">
					<g:if test="${pg.natureza.equals('C')}">
						${pg.valor}
					</g:if>
				</td>						

				<td class="dado">
					<g:if test="${pg.natureza.equals('D')}">
						${pg.valor}
					</g:if>
				</td>

				<td class="dado">0,00</td>
				
				<td class="dado">${pg.subcategoria}</td>
				
				<td>${pg.descricao}</td>
			</tr>
		</g:each>

		<tr class="saldo">
			<td></td>
		
			<td class="dado">TOTAL</td>

			<td class="dado">${fluxoCaixa.entradas}</td>

			<td class="dado">${fluxoCaixa.saidas}</td>
			
			<td class="dado">${fluxoCaixa.saldo}</td>
			
			<td class="dado"></td>
			
			<td class="dado"></td>
		</tr>
	</table>
</g:if>