<%@page import="com.cashbuilder.utils.Constants"%>

<g:if test="${fluxoCaixa}">
	<table>
		<tbody>
			<tr class="header">
				<td></td>
				<td>Dia</td>
				<td>Entrada</td>
				<td>Saida</td>
				<td>Categoria</td>
				<td>Descricao</td>
			</tr>
	
			<g:javascript>
			$(function() {
				ajaxSubmit('editButton','modal','edit');
			});
			</g:javascript>
	
			<g:each var="pg" in="${fluxoCaixa.pagamentos}">
				<tr>
					<td width="50">
		                <g:form name="formEdit" controller="pagamento">
		                    <g:hiddenField name="id" value="${pg.id}" />
		                    <g:submitButton name="editButton" class="bt_edit" value="" title="editar"/>
		                    <input type="submit" name="_action_delete" class="bt_delete" value="" title="excluir" onclick="return confirm('Tem Certeza?');" />
		                </g:form>
					</td>
					<td width="40"><g:formatDate format="dd" date="${pg.data}"></g:formatDate></td>
	
					<td width="90">
						<g:if test="${pg.natureza.equals('C')}">
							<g:formatNumber number="${pg.valor}" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
						</g:if>
						<g:else>
							<g:formatNumber number="${0 }" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
						</g:else>
					</td>						
	
					<td width="90">
						<g:if test="${pg.natureza.equals('D')}">
						  <g:formatNumber number="${pg.valor}" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
						</g:if>
						<g:else>
							<g:formatNumber number="${0 }" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
						</g:else>
					</td>

					<td width="100">${pg.subcategoria}</td>
					
					<td>${pg.descricao}</td>
				</tr>
			</g:each>
		</tbody>
	</table>
</g:if>