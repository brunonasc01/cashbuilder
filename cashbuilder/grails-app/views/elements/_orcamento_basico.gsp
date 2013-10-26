<%@page import="com.cashbuilder.Constants"%>

<g:if test="${list}">
<div id="budget-list" class="content">
	<g:each var="category" in="${list}" status="i">
		<div class="budget-item">
			<h4>${category.name}</h4>

			<g:hiddenField name="prevVal" value="${category.budgetedValue }"/>
			<g:hiddenField name="realVal" value="${category.realizedValue }"/>
		
			<ul class="inline main-category">
				<li class="button"><span class="bt_expand bt-icon icon-plus"></span>
				</li><li class="values real-col text-right"><g:formatNumber number="${category.realizedValue }" format="${Constants.FORMATO_MOEDA}"/>
				</li><li class="progress-bar"><span class="${category.barClass }" style="width:${category.barSize}%;"></span>
				</li><li class="values prev-col"><g:formatNumber number="${category.budgetedValue }" format="${Constants.FORMATO_MOEDA}"/></li>
			</ul>

			<div id="childItem_${i}" class="subcategory-list">
				<g:if test="${category.subcategories}">
					<g:each var="subcategory" in="${category.subcategories}">
						<ul class="inline">
							<li class="button">
								<g:if test="${!consult_mode }">
									<g:form name="editBudgetForm" action="edit" controller="budgetItem">
										<g:hiddenField name="id" value="${subcategory.budgetItem?.id}"/>
										<g:hiddenField name="monthId" value="${monthIndex}"/>
										<span id="bt_edit_budget" class="bt-icon icon-edit"></span>
									</g:form>
								</g:if>
							</li><li class="child-name">${subcategory.name}
							</li><li class="child-values text-right">
									<g:formatNumber number="${subcategory.realizedValue }" format="${Constants.FORMATO_MOEDA}"/>
									<g:message code="default.of"/>
									<g:formatNumber number="${subcategory.budgetedValue }" format="${Constants.FORMATO_MOEDA}"/>
							</li><li class="progress-bar"><span class="${subcategory.barClass }" style="width:${subcategory.barSize}%;"></span>
							</li>
						</ul>
					</g:each>
				</g:if>
			</div>
		</div>
	</g:each>
</div>	
</g:if>

	