<g:if test="${flash.message}">
	<div class="col-1">
		<div class="message ${flash.msg_type}">
			<p>
				<g:message code="${flash.message}"/>
			</p>
			
			<g:if test="${flash.errors}">
				${flash.errors}
			</g:if>
			<g:else>
				<g:hasErrors bean="${bean}">
					<g:renderErrors bean="${bean}" as="list" />
				</g:hasErrors>
			</g:else>
		</div>
	</div>
</g:if>