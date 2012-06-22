<%@page import="com.cashbuilder.DateUtils"%>

<g:javascript>
$(function() {
	monthMenuUI('${index}','menuMonth');
});
</g:javascript>

<div id="menuMonth">
	<ul>
		<li><g:link params="[monthId:'0']" action="${action}">${DateUtils.getMonth(0)}</g:link></li>
		<li><g:link params="[monthId:'1']" action="${action}">${DateUtils.getMonth(1)}</g:link></li>
		<li><g:link params="[monthId:'2']" action="${action}">${DateUtils.getMonth(2)}</g:link></li>
		<li><g:link params="[monthId:'3']" action="${action}">${DateUtils.getMonth(3)}</g:link></li>
		<li><g:link params="[monthId:'4']" action="${action}">${DateUtils.getMonth(4)}</g:link></li>
		<li><g:link params="[monthId:'5']" action="${action}">${DateUtils.getMonth(5)}</g:link></li>
		<li><g:link params="[monthId:'6']" action="${action}">${DateUtils.getMonth(6)}</g:link></li>
		<li><g:link params="[monthId:'7']" action="${action}">${DateUtils.getMonth(7)}</g:link></li>
		<li><g:link params="[monthId:'8']" action="${action}">${DateUtils.getMonth(8)}</g:link></li>
		<li><g:link params="[monthId:'9']" action="${action}">${DateUtils.getMonth(9)}</g:link></li>
		<li><g:link params="[monthId:'10']" action="${action}">${DateUtils.getMonth(10)}</g:link></li>
		<li><g:link params="[monthId:'11']" action="${action}">${DateUtils.getMonth(11)}</g:link></li>
	</ul>
</div>