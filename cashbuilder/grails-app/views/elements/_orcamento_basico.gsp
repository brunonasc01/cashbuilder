<%@page import="com.cashbuilder.Constants"%>

<g:if test="${list}">
<div id="budget-list" class="content">
	<g:each var="category" in="${list}" status="i">
		<div class="budget-item">
			<h4>${category.name}</h4>

			<g:hiddenField name="prevVal" value="${category.budgetedValue }"/>
			<g:hiddenField name="realVal" value="${category.realizedValue }"/>
		
			<ul class="inline main-category">
				<li class="button"><span id="bt_expand" class="bt-icon icon-plus"></span>
				</li><li class="values text-right"><g:formatNumber number="${category.realizedValue }" format="${Constants.FORMATO_MOEDA}"/>
				</li><li class="progress-bar"><span class="" style="width:${50}%;"></span>
				</li><li class="values"><g:formatNumber number="${category.budgetedValue }" format="${Constants.FORMATO_MOEDA}"/></li>
			</ul>

			<div id="childItem_${i}" class="subcategory-list">
				<g:if test="${category.subcategories}">
					<g:each var="subcategory" in="${category.subcategories}">
						<ul class="inline">
							<li class="button"><span id="bt_edit_budget" class="bt-icon icon-edit"></span>
							</li><li class="child-name">${subcategory.name}
							</li><li class="values text-right"><g:formatNumber number="${subcategory.realizedValue }" format="${Constants.FORMATO_MOEDA}"/>
							</li><li class="of"><g:message code="default.of"/>
							</li><li class="values"><g:formatNumber number="${subcategory.budgetedValue }" format="${Constants.FORMATO_MOEDA}"/>
							</li><li class="progress-bar"><span style="width:${30}%;"></span>
							</li>
						</ul>
					</g:each>
				</g:if>
			</div>
		</div>
	</g:each>
</div>	
</g:if>

	