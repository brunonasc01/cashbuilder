	<div class="box_ultimos_pgs">
		<g:if test="${ultimosRegistros }">
			<g:each var="pagamento" in="${ultimosRegistros.results}">
				<p>${pagamento.id } : ${pagamento.valor}</p>	
			</g:each>
		</g:if>
	</div>