<%@page import="com.cashbuilder.DateUtils"%>

<div class="col-1">
	<nav id="months">
		<g:each in="${0..11}" var="index"><a href="?monthId=${index }" class="${(index == currentMonth && !nextYear)? 'active' : ((index < DateUtils.currentMonth)? 'past':'') }"><g:message code="month.short.${index }"/></a></g:each>
		<g:if test="${DateUtils.isLastMonthOfYear() }">
			<g:link params="[monthId:'0',nextYear:'true']" class="nextYear ${(nextYear)? 'active':'' }" action="${action}">
				${DateUtils.currentYear+1 }
			</g:link>
		</g:if>
	</nav>
</div>
