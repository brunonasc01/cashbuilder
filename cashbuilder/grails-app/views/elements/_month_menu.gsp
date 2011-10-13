<%@page import="com.cashbuilder.utils.DateUtils"%>

<div class="month_menu ui-corner-all span-22 shadow_content">
	<ul id="month_list">
		<li><g:link params="[mesId:'0']">${DateUtils.getMes(0)}</g:link></li>
		<li><g:link params="[mesId:'1']">${DateUtils.getMes(1)}</g:link></li>
		<li><g:link params="[mesId:'2']">${DateUtils.getMes(2)}</g:link></li>
		<li><g:link params="[mesId:'3']">${DateUtils.getMes(3)}</g:link></li>
		<li><g:link params="[mesId:'4']">${DateUtils.getMes(4)}</g:link></li>
		<li><g:link params="[mesId:'5']">${DateUtils.getMes(5)}</g:link></li>
		<li><g:link params="[mesId:'6']">${DateUtils.getMes(6)}</g:link></li>
		<li><g:link params="[mesId:'7']">${DateUtils.getMes(7)}</g:link></li>
		<li><g:link params="[mesId:'8']">${DateUtils.getMes(8)}</g:link></li>
		<li><g:link params="[mesId:'9']">${DateUtils.getMes(9)}</g:link></li>
		<li><g:link params="[mesId:'10']">${DateUtils.getMes(10)}</g:link></li>
		<li><g:link params="[mesId:'11']">${DateUtils.getMes(11)}</g:link></li>
	</ul>
</div>