<%@page import="com.cashbuilder.DateUtils"%>

<g:javascript>
$(function() {
	setMonthSelection('${nextYear? 12 : index}','months','${DateUtils.currentMonth}');
});
</g:javascript>

<div class="col-1">
	<nav id="months">
		<g:each in="${0..11}" var="index"><a href="?monthId=${index }"><g:message code="month.short.${index }"/></a></g:each>
		<g:if test="${DateUtils.isLastMonthOfYear() }">
			<g:link params="[monthId:'0',nextYear:'true']" class="nextYear" action="${action}">
				${DateUtils.currentYear+1 }
			</g:link>
		</g:if>
	</nav>
</div>
