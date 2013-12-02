<%@page import="com.cashbuilder.Constants"%>
	
<div class="box">
	<h3 class="title-box"><g:message code="box.transaction.title.next"/></h3>

	<div id="transaction-list-box" class="content">
		<g:if test="${list }">
			<g:each var="transaction" in="${list}" status="counter">
				<ul class="inline">
					<li><g:formatDate date="${transaction.date }" format="dd/MM"></g:formatDate>
					</li><li class="text-center ${transaction.nature == Constants.DEBITO? "negative" : "positive" }">
						<g:formatNumber number="${transaction.value }" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
					</li><li class="category"><i>${transaction.subcategory }</i>
					</li><li class="description">${transaction.description}</li>
				</ul>
			</g:each>
		</g:if>
		<g:else>
			<p><g:message code="box.transaction.empty.next"/></p>
		</g:else>
	</div>
</div>