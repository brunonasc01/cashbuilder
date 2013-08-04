<%@page import="com.cashbuilder.Constants"%>
	
<div class="box">
	<h3 class="title-box"><g:message code="box.lasttransaction.title"/></h3>

	<div id="transaction-list-box" class="content">
		<g:if test="${ultimosRegistros }">
			<g:each var="transaction" in="${ultimosRegistros}" status="counter">
				<ul class="inline">
					<li>
						<g:formatDate date="${transaction.date }" format="dd/MM"></g:formatDate>
					</li><li class="text-center ${transaction.nature == Constants.DEBITO? "negative" : "positive" }">
						<g:formatNumber number="${transaction.value }" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
					</li><li class="category">
						<i>${transaction.subcategory }</i>
					</li>
					<li class="description">
						${transaction.description}
					</li>
				</ul>	
			</g:each>
		</g:if>
		<g:else>
			<g:message code="box.lasttransaction.empty"/>
		</g:else>
	</div>
</div>