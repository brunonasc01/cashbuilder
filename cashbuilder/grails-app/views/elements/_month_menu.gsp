<%@page import="com.cashbuilder.DateUtils"%>

<g:javascript>
$(function() {
	setMonthSelection('${nextYear? 12 : index}','month-list');
});
</g:javascript>

<div class="col-1 text-center">
	<nav id="month-list">
		<g:link params="[monthId:'0']" action="${action}"><span><g:message code="month.0"/></span>
		</g:link><g:link params="[monthId:'1']" action="${action}"><span><g:message code="month.1"/></span>
		</g:link><g:link params="[monthId:'2']" action="${action}"><span><g:message code="month.2"/></span>
		</g:link><g:link params="[monthId:'3']" action="${action}"><span><g:message code="month.3"/></span>
		</g:link><g:link params="[monthId:'4']" action="${action}"><span><g:message code="month.4"/></span>
		</g:link><g:link params="[monthId:'5']" action="${action}"><span><g:message code="month.5"/></span>
		</g:link><g:link params="[monthId:'6']" action="${action}"><span><g:message code="month.6"/></span>
		</g:link><g:link params="[monthId:'7']" action="${action}"><span><g:message code="month.7"/></span>
		</g:link><g:link params="[monthId:'8']" action="${action}"><span><g:message code="month.8"/></span>
		</g:link><g:link params="[monthId:'9']" action="${action}"><span><g:message code="month.9"/></span>
		</g:link><g:link params="[monthId:'10']" action="${action}"><span><g:message code="month.10"/></span>
		</g:link><g:link params="[monthId:'11']" action="${action}"><span><g:message code="month.11"/></span></g:link>
		<g:if test="${DateUtils.isLastMonthOfYear() }">
			<g:link params="[monthId:'0',nextYear:'true']" class="nextYear" action="${action}">
				<span><g:message code="month.0"/> ${DateUtils.currentYear+1 }</span>
			</g:link>
		</g:if>
	</nav>
</div>
