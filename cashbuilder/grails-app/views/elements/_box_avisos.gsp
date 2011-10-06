<div class="box avisos ui-corner-all shadow_box">
	<p class="title">Avisos</p>
	<ul>
		<g:if test="${alerts}">
			<g:each var="alert" in="${alerts }">
				<li><g:message code="${alert.message }" /> </li>
			</g:each>
		</g:if>
		<g:else>
			<li>Nenhum alerta</li>
		</g:else>
	</ul>
</div>