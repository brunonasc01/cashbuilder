<%@page import="com.cashbuilder.utils.Constants"%>

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
	
			<g:javascript>
			$(function() {
				ajaxSubmitToModal('btSubmit','/cashbuilder/pagamento/ajaxEdit','popupNovo');
			});
			</g:javascript>
	
			<g:each var="pg" in="${fluxoCaixa.pagamentos}">
				<tr>
					<td>
		                <g:form name="formEdit" controller="pagamento">
		                    <input type="hidden" name="id" value="${pg.id}" id="id" />
		                    <input type="submit" id="btSubmit" name="edit" class="bt_edit" value="" title="editar" />
		                    <input type="submit" name="_action_delete" class="bt_delete" value="" title="excluir" onclick="return confirm('Tem Certeza?');" />
		                </g:form>
					</td>
					<td><g:formatDate format="dd" date="${pg.data}"></g:formatDate></td>
	
					<td>
						<g:if test="${pg.natureza.equals('C')}">
							<g:formatNumber number="${pg.valor}" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
						</g:if>
						<g:else>
							<g:formatNumber number="${0 }" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
						</g:else>
					</td>						
	
					<td>
						<g:if test="${pg.natureza.equals('D')}">
						  <g:formatNumber number="${pg.valor}" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
						</g:if>
						<g:else>
							<g:formatNumber number="${0 }" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
						</g:else>
					</td>

					<td>${pg.subcategoria}</td>
					
					<td class="descricao">${pg.descricao}</td>
				</tr>
			</g:each>
		</tbody>
	</table>
</g:if>