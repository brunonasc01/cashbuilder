<%@page import="com.cashbuilder.Constants"%>

<div class="box">
	<h3 class="title-box"><g:message code="${bean.title}"/></h3>
	
	<div class="content balance-box-home">
		<ul>
			<li class="title"><g:message code="box.balance.label.income"/>
			</li><li class="value positive">
				 <g:formatNumber number="${bean.income}"
						format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
			</li>
		</ul><ul>
			<li class="title"><g:message code="box.balance.label.expense"/>
			</li><li class="value negative">
				 <g:formatNumber number="${bean.expense}"
						format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
			</li>
		</ul><ul>
			<li class="title"><g:message code="box.balance.label.balance"/>
			</li><li class="value ${bean.balanceClass}">
				 <g:formatNumber number="${bean.balance.abs()}"
						format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
			</li>
		</ul>
	</div>
	
</div>