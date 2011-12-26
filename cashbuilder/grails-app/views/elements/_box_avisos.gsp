<div id="lbox">
	<div class="title">
		Avisos
	</div>
	<div class="inside">
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
</div>