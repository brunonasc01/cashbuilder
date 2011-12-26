<%@page import="com.cashbuilder.utils.Constants"%>

<g:if test="${fluxoCaixa}">
	<div id="itemList">
		<ul class="header">
			<li class="buttons">.....</li>
			<li class="day">Dia</li>
			<li class="in">Entrada</li>
			<li class="out">Saida</li>
			<li class="category">Categoria</li>
			<li class="desc">Descricao</li>
		</ul>

		<g:javascript>
		$(function() {
			ajaxSubmitToModal('btSubmit','/cashbuilder/pagamento/ajaxEdit','popupNovo');
		});
		</g:javascript>

		<g:each var="pg" in="${fluxoCaixa.pagamentos}">
			<ul>
				<li class="buttons">
					<g:form name="formEdit" controller="pagamento">
	                    <input type="hidden" name="id" value="${pg.id}" id="id" />
	                    <input type="submit" id="btSubmit" name="edit" class="bt_edit" value="" title="editar" />
	                    <input type="submit" name="_action_delete" class="bt_delete" value="" title="excluir" onclick="return confirm('Tem Certeza?');" />
	                </g:form>
				</li>
				<li class="day">
					<g:formatDate format="dd" date="${pg.data}"></g:formatDate>
				</li>
				<li class="in">
					<g:if test="${pg.natureza.equals('C')}">
						<g:formatNumber number="${pg.valor}" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
					</g:if>
					<g:else>
						<g:formatNumber number="${0 }" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
					</g:else>
				</li>
				<li class="out">
					<g:if test="${pg.natureza.equals('D')}">
					  <g:formatNumber number="${pg.valor}" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
					</g:if>
					<g:else>
						<g:formatNumber number="${0 }" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
					</g:else>
				</li>
				<li class="category">${pg.subcategoria}</li>
				<li class="desc">${pg.descricao}</li>
			</ul>
			
			<div class="clear"></div>
		</g:each>
	</div>
</g:if>