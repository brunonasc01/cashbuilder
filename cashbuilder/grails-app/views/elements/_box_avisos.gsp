<div id="lbox">
	<div class="title">
		<g:message code="box.alert.title" />
	</div>
	<div class="inside">
		<ul>
			<g:if test="${alerts}">
				<g:each var="alert" in="${alerts }">
					<li><g:message code="${alert.message }" /> </li>
				</g:each>
			</g:if>
			<g:else>
				<li><g:message code="alert.no.message" /></li>
			</g:else>
		</ul>
	</div>
</div>