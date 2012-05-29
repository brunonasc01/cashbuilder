<%@page import="com.cashbuilder.utils.Constants"%>

<g:if test="${list}">	
	<g:each var="category" in="${list}" status="i">
		<div id="budgetList">
			<div id="fatherItem">

				<g:hiddenField name="prevVal" value="${category.budgetedValue }"/>
				<g:hiddenField name="realVal" value="${category.realizedValue }"/>
			
				<ul>
					<li class="name">${category.name }</li>
					<li class="button"><span class="ui-icon ui-icon-circle-plus"></span></li>
					<li class="values"><span class="right"><g:formatNumber number="${category.realizedValue }" format="${Constants.FORMATO_MOEDA}"/></span></li>
					<li class="pbar"><div id="progressbar"></div></li>
					<li class="values"><g:formatNumber number="${category.budgetedValue }" format="${Constants.FORMATO_MOEDA}"/></li>
				</ul>
			</div>

			<div class="clear"></div>
			
			<div id="childItem">
				<g:if test="${category.subcategories}">
					<g:each var="subcategory" in="${category.subcategories}">
					<div id="item">
						<div class="edit"><button>EDITAR</button></div>
						
						<div class="save">
							<g:form action="update" controller="budgetItem">
								<button type="submit">GRAVAR</button>
								<button name="undo">DESFAZER</button>
								
								<g:hiddenField name="monthId" value="${monthIndex}"/>
								<g:hiddenField name="id" value="${subcategory.budgetItem?.id}"/>
								<g:hiddenField name="budgetedValue" value="${df.format(subcategory.budgetedValue) }"/>
							</g:form>
							
						</div>
						
						<g:hiddenField name="prevVal" value="${subcategory.budgetedValue }"/>
						<g:hiddenField name="realVal" value="${subcategory.realizedValue }"/>

						<ul id="basic">
							<li class="name">${subcategory.name }</li>
							<li class="values"><span class="right"><g:formatNumber number="${subcategory.realizedValue }" format="${Constants.FORMATO_MOEDA}"/></span></li>
							<li class="of">de</li>
							<li class="values" id="prev"><g:formatNumber number="${subcategory.budgetedValue }" format="${Constants.FORMATO_MOEDA}"/></li>
							<li class="bar"><div id="progressbar"></div></li>
						</ul>
						
						<ul id="edition"> 
							<li class="name">${subcategory.name }</li>
							<li class="values"><span class="right"><g:formatNumber number="${subcategory.realizedValue }" format="${Constants.FORMATO_MOEDA}"/></span></li>
							<li class="of">de</li>
							<li class="values" id="prev"><g:formatNumber number="${subcategory.budgetedValue }" format="${Constants.FORMATO_MOEDA}"/></li>
							<li class="slider"><div id="sliderbar"></div></li>
							<li class="input"><g:textField size="6" name="manualValue" value="${df.format(subcategory.budgetedValue)}"/></li>
						</ul>

						<div class="clear"></div>
					</div>
					</g:each>
				</g:if>
			</div>
			
			<div class="clear"></div>
		</div>
		
		<g:if test="${i < list.size()-1}">
			<hr />
		</g:if>
	</g:each>
</g:if>

	