<%@page import="com.cashbuilder.TextUtils"%>
<%@page import="com.cashbuilder.Constants"%>
	
<div id="rbox">
	<div class="title">
		<g:message code="box.lasttransaction.title"/>
	</div>
	<div id="lastTransactionsBox" class="inside">
		<g:if test="${ultimosRegistros }">
			<g:each var="transaction" in="${ultimosRegistros}" status="counter">
				<ul class="${counter == ultimosRegistros.size() - 1? 'last' : ''  }">
					<li class="date">
						<g:formatDate date="${transaction.date }" format="dd/MM"></g:formatDate>
					</li>
					<li class="value">
						<g:formatNumber number="${transaction.value }" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
					</li>					
					<li class="category">
						${transaction.subcategory }
					</li>
					<li class="description">
						${TextUtils.abbreviateText(transaction.description,45)  }
					</li>
				</ul>
			</g:each>
		</g:if>
		<g:else>
			<g:message code="box.lasttransaction.empty"/>
		</g:else>
	</div>
	<div class="clear"></div>
</div>