<%@page import="com.cashbuilder.utils.TextUtils"%>
<%@page import="com.cashbuilder.utils.Constants"%>
	
<div id="rbox">
	<div class="title">
		Ultimos Registros
	</div>
	<div class="inside">
		<g:if test="${ultimosRegistros }">
			<g:each var="pagamento" in="${ultimosRegistros}">
				<ul>
					<li>
						<g:formatDate date="${pagamento.data }" format="dd/MM"></g:formatDate>
					</li>
					<li>
						${pagamento.subcategoria }
					</li>
					<li>
						${TextUtils.abbreviateText(pagamento.descricao,45)  }
					</li>
				</ul>
			</g:each>
		</g:if>
		<g:else>
			Nenhum registro
		</g:else>
	</div>
</div>