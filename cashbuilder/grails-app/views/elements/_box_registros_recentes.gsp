<%@page import="com.cashbuilder.utils.TextUtils"%>
<%@page import="com.cashbuilder.utils.Constants"%>
	
<div id="rbox">
	<div class="title">
		Ultimos Registros
	</div>
	<div id="lastTransactionsBox" class="inside">
		<g:if test="${ultimosRegistros }">
			<g:each var="pagamento" in="${ultimosRegistros}">
				<ul>
					<li class="date">
						<g:formatDate date="${pagamento.data }" format="dd/MM"></g:formatDate>
					</li>
					<li class="value">
						<g:formatNumber number="${pagamento.valor }" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
					</li>
					<li class="category">
						${pagamento.subcategoria }
					</li>
					<li class="description">
						${TextUtils.abbreviateText(pagamento.descricao,45)  }
					</li>
				</ul>
			</g:each>
		</g:if>
		<g:else>
			Nenhum registro
		</g:else>
	</div>
	<div class="clear"></div>
</div>