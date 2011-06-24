	<div class="box registros_recentes ui-corner-all">
		<g:if test="${ultimosRegistros }">
			<g:each var="pagamento" in="${ultimosRegistros.results}">
				<p>${pagamento.id } : ${pagamento.valor}</p>	
			</g:each>
		</g:if>
	</div>