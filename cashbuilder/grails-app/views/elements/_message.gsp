<g:if test="${consult_mode}">
	<div class="col-1">
		<div class="message info">
			<p>
				<g:message code="default.consult_mode.messsage1"/> <b>${session.consult_year }</b>. <g:message code="default.consult_mode.messsage2"/>
				<g:link action="reset_consult" class="message_link">clique aqui</g:link>
			</p>
		</div>
	</div>
</g:if>
<g:elseif test="${flash.message}">
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
</g:elseif>