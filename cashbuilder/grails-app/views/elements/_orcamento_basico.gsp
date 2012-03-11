<%@page import="com.cashbuilder.utils.Constants"%>

<g:if test="${list}">	
	<g:each var="category" in="${list}">
		<div id="budgetList">
			<div id="fatherItem">

				<g:hiddenField name="prevVal" value="${category.valorPrevisto }"/>
				<g:hiddenField name="realVal" value="${category.valorRealizado }"/>
			
				<ul>
					<li class="name">${category.nome }</li>
					<li class="button">+</li>
					<li class="values"><span class="right"><g:formatNumber number="${category.valorRealizado }" format="${Constants.FORMATO_MOEDA}"/></span></li>
					<li class="pbar"><div id="progressbar"></div></li>
					<li class="values"><g:formatNumber number="${category.valorPrevisto }" format="${Constants.FORMATO_MOEDA}"/></li>
				</ul>
			</div>

			<div class="clear"></div>
			
			<div id="childItem">
				<g:if test="${category.subcategorias}">
					<g:each var="subcategory" in="${category.subcategorias}">
					<div id="item">
						<div class="edit"><button>EDITAR</button></div>
						
						<div class="save">
							<g:form action="update" controller="orcmItem">
								<button type="submit">GRAVAR</button>
								<button name="undo">DESFAZER</button>
								
								<g:hiddenField name="mesId" value="${monthIndex}"/>
								<g:hiddenField name="id" value="${subcategory.orcmItem?.id}"/>
								<g:hiddenField name="valorPrevisto" value="${df.format(subcategory.valorPrevisto) }"/>
							</g:form>
							
						</div>
						
						<g:hiddenField name="prevVal" value="${subcategory.valorPrevisto }"/>
						<g:hiddenField name="realVal" value="${subcategory.valorRealizado }"/>

						<ul id="basic">
							<li class="name">${subcategory.nome }</li>
							<li class="values"><span class="right"><g:formatNumber number="${subcategory.valorRealizado }" format="${Constants.FORMATO_MOEDA}"/></span></li>
							<li class="of">de</li>
							<li class="values" id="prev"><g:formatNumber number="${subcategory.valorPrevisto }" format="${Constants.FORMATO_MOEDA}"/></li>
							<li class="bar"><div id="progressbar"></div></li>
						</ul>
						
						<ul id="edition"> 
							<li class="name">${subcategory.nome }</li>
							<li class="values"><span class="right"><g:formatNumber number="${subcategory.valorRealizado }" format="${Constants.FORMATO_MOEDA}"/></span></li>
							<li class="of">de</li>
							<li class="values" id="prev"><g:formatNumber number="${subcategory.valorPrevisto }" format="${Constants.FORMATO_MOEDA}"/></li>
							<li class="slider"><div id="sliderbar"></div></li>
							<li class="input"><g:textField size="6" name="manualValue" value="${df.format(subcategory.valorPrevisto)}"/></li>
						</ul>

						<div class="clear"></div>
					</div>
					</g:each>
				</g:if>
			</div>
			
			<div class="clear"></div>
		</div>
	</g:each>
</g:if>

	