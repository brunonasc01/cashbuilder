<%@page import="com.cashbuilder.utils.DateUtils"%>

<g:javascript>
$(function() {
	monthMenuUI('${index}','menuMonth');
});
</g:javascript>

<div id="menuMonth">
	<ul>
		<li><g:link params="[monthId:'0']" action="${action}">${DateUtils.getMes(0)}</g:link></li>
		<li><g:link params="[monthId:'1']" action="${action}">${DateUtils.getMes(1)}</g:link></li>
		<li><g:link params="[monthId:'2']" action="${action}">${DateUtils.getMes(2)}</g:link></li>
		<li><g:link params="[monthId:'3']" action="${action}">${DateUtils.getMes(3)}</g:link></li>
		<li><g:link params="[monthId:'4']" action="${action}">${DateUtils.getMes(4)}</g:link></li>
		<li><g:link params="[monthId:'5']" action="${action}">${DateUtils.getMes(5)}</g:link></li>
		<li><g:link params="[monthId:'6']" action="${action}">${DateUtils.getMes(6)}</g:link></li>
		<li><g:link params="[monthId:'7']" action="${action}">${DateUtils.getMes(7)}</g:link></li>
		<li><g:link params="[monthId:'8']" action="${action}">${DateUtils.getMes(8)}</g:link></li>
		<li><g:link params="[monthId:'9']" action="${action}">${DateUtils.getMes(9)}</g:link></li>
		<li><g:link params="[monthId:'10']" action="${action}">${DateUtils.getMes(10)}</g:link></li>
		<li><g:link params="[monthId:'11']" action="${action}">${DateUtils.getMes(11)}</g:link></li>
	</ul>
</div>