<g:if test="${flash.message}">
	<div class="col-1">
		<div class="message ${flash.msg_type}">
			<p>
				<g:message code="${flash.message}"/>
			</p>
			
			<g:hasErrors bean="${bean}">
				<g:renderErrors bean="${bean}" as="list" />
			</g:hasErrors>
		</div>
	</div>
</g:if>