<g:if test="${consult_mode}">
	<div class="col-1">
		<div class="message info">
			<p>
				<g:message code="default.consult_mode.messsage.activated"/>
				<b>${session.consult_year }</b>. <g:message code="default.consult_mode.message.warning"/>
				<g:link action="reset_consult" class="message_link"><g:message code="default.click_here"/></g:link>
			</p>
		</div>
	</div>
</g:if>
<g:elseif test="${flash.message}">
	<div class="col-1">
		<div class="message ${flash.msg_type}">
			<p><g:message code="${flash.message}"/></p>

			<g:if test="${flash.budget_updated}" >
				<ul><li><g:message code="default.budget_update.message"/></li></ul>
			</g:if>
			<g:elseif test="${flash.errors}">
				${flash.errors}
			</g:elseif>
			<g:else>
				<g:hasErrors bean="${bean}">
					<g:renderErrors bean="${bean}" as="list" />
				</g:hasErrors>
			</g:else>
		</div>
	</div>
</g:elseif>