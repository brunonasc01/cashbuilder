<div class="box">
	<h3 class="title-box"><g:message code="box.alert.title" /></h3>

	<div class="content">
		<ul>
			<g:if test="${alerts}">
				<g:each var="alert" in="${alerts }" status="index">
					<li><b>${index+1})</b> <g:message code="${alert.message }" /> </li>
				</g:each>
			</g:if>
			<g:else>
				<li><g:message code="alert.no.message" /></li>
			</g:else>
		</ul>
	</div>
</div>