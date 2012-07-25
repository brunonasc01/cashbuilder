
<g:javascript>
$(function() {
	monthMenuUI('${index}','menuMonth');
});
</g:javascript>

<div id="menuMonth">
	<ul>
		<li><g:link params="[monthId:'0']" action="${action}"><g:message code="month.january"/></g:link></li>
		<li><g:link params="[monthId:'1']" action="${action}"><g:message code="month.february"/></g:link></li>
		<li><g:link params="[monthId:'2']" action="${action}"><g:message code="month.march"/></g:link></li>
		<li><g:link params="[monthId:'3']" action="${action}"><g:message code="month.april"/></g:link></li>
		<li><g:link params="[monthId:'4']" action="${action}"><g:message code="month.may"/></g:link></li>
		<li><g:link params="[monthId:'5']" action="${action}"><g:message code="month.june"/></g:link></li>
		<li><g:link params="[monthId:'6']" action="${action}"><g:message code="month.july"/></g:link></li>
		<li><g:link params="[monthId:'7']" action="${action}"><g:message code="month.august"/></g:link></li>
		<li><g:link params="[monthId:'8']" action="${action}"><g:message code="month.setptember"/></g:link></li>
		<li><g:link params="[monthId:'9']" action="${action}"><g:message code="month.october"/></g:link></li>
		<li><g:link params="[monthId:'10']" action="${action}"><g:message code="month.november"/></g:link></li>
		<li><g:link params="[monthId:'11']" action="${action}"><g:message code="month.december"/></g:link></li>
	</ul>
</div>