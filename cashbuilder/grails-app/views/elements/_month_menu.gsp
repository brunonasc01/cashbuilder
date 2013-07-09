
<%@page import="com.cashbuilder.DateUtils"%>

<g:javascript>
$(function() {
	setMonthSelection('${nextYear? 12 : index}','month-list');
});
</g:javascript>

<div class="col-1 text-center">
	<nav id="month-list">
		<g:link params="[monthId:'0']" action="${action}"><span><g:message code="month.january"/></span>
		</g:link><g:link params="[monthId:'1']" action="${action}"><span><g:message code="month.february"/></span>
		</g:link><g:link params="[monthId:'2']" action="${action}"><span><g:message code="month.march"/></span>
		</g:link><g:link params="[monthId:'3']" action="${action}"><span><g:message code="month.april"/></span>
		</g:link><g:link params="[monthId:'4']" action="${action}"><span><g:message code="month.may"/></span>
		</g:link><g:link params="[monthId:'5']" action="${action}"><span><g:message code="month.june"/></span>
		</g:link><g:link params="[monthId:'6']" action="${action}"><span><g:message code="month.july"/></span>
		</g:link><g:link params="[monthId:'7']" action="${action}"><span><g:message code="month.august"/></span>
		</g:link><g:link params="[monthId:'8']" action="${action}"><span><g:message code="month.setptember"/></span>
		</g:link><g:link params="[monthId:'9']" action="${action}"><span><g:message code="month.october"/></span>
		</g:link><g:link params="[monthId:'10']" action="${action}"><span><g:message code="month.november"/></span>
		</g:link><g:link params="[monthId:'11']" action="${action}"><span><g:message code="month.december"/></span></g:link>
		<g:if test="${DateUtils.isLastMonthOfYear() }">
			<g:link params="[monthId:'0',nextYear:'true']" class="nextYear" action="${action}"><span><g:message code="month.january"/> ${DateUtils.currentYear+1 }</span></g:link>
		</g:if>
	</nav>
</div>
