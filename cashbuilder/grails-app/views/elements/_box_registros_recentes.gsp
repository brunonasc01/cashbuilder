<%@page import="com.cashbuilder.utils.TextUtils"%>
<%@page import="com.cashbuilder.utils.Constants"%>
	
<div class="box registros_recentes ui-corner-all shadow_box">
	<p class="title">Ultimos Registros</p>
	<g:if test="${ultimosRegistros }">
		<g:each var="pagamento" in="${ultimosRegistros}">
			<div class="data span-6">
				<g:formatDate date="${pagamento.data }" format="dd/MM"></g:formatDate>
			</div>
			<div class="item_data span-6">
				<div class="span-2">
					<g:formatNumber number="${pagamento.valor }" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
				</div>	
				<div class="span-4 last">
					${pagamento.subcategoria }
				</div>
				<div class="span-6">
					${TextUtils.abbreviateText(pagamento.descricao,35)  }
				</div>
			</div>
		</g:each>
	</g:if>
	<g:else>
		Nenhum registro
	</g:else>
</div>