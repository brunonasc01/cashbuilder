	<div class="box registros_recentes ui-corner-all shadow_box">
		<g:if test="${ultimosRegistros }">
			<p class="title">Ultimos Registros</p>
			<g:each var="pagamento" in="${ultimosRegistros.results}">
				<p class="data"><g:formatDate date="${pagamento.data }" format="dd/MM"></g:formatDate></p>
				<div class="span-2">
					R$ ${pagamento.valor }
				</div>	
				<div class="span-3 last">
					${pagamento.subcategoria }
				</div>
				<p class="descricao">
					${pagamento.descricao }
				</p>
			</g:each>
		</g:if>
	</div>