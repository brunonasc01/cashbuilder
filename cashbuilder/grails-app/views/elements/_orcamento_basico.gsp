<%@page import="com.cashbuilder.utils.Constants"%>

<g:if test="${list}">	
	<g:each var="orcm" in="${list}">
		<div id="budgetList">
			<div id="fatherItem">

				<g:hiddenField name="prevVal" value="${orcm.valorPrevisto }"/>
				<g:hiddenField name="realVal" value="${orcm.valorRealizado }"/>
			
				<ul>
					<li class="name">${orcm.nome }</li>
					<li class="button">+</li>
					<li class="values"><span class="right"><g:formatNumber number="${orcm.valorRealizado }" format="${Constants.FORMATO_MOEDA}"/></span></li>
					<li class="pbar"><div id="progressbar"></div></li>
					<li class="values"><g:formatNumber number="${orcm.valorPrevisto }" format="${Constants.FORMATO_MOEDA}"/></li>
				</ul>
			</div>

			<div class="clear"></div>
			
			<div id="childItem">
				<g:if test="${orcm.subcategorias}">
					<g:each var="orcmFilho" in="${orcm.subcategorias}">
						
						<g:hiddenField name="prevVal" value="${orcmFilho.valorPrevisto }"/>
						<g:hiddenField name="realVal" value="${orcmFilho.valorRealizado }"/>

						<ul>
							<li class="name">${orcmFilho.nome }</li>
							<li class="values"><span class="right"><g:formatNumber number="${orcmFilho.valorRealizado }" format="${Constants.FORMATO_MOEDA}"/></span></li>
							<li class="of">de</li>
							<li class="values"><g:formatNumber number="${orcmFilho.valorPrevisto }" format="${Constants.FORMATO_MOEDA}"/></li>
							<li class="bar"><div id="progressbar"></div></li>
						</ul>

						<div class="clear"></div>
					</g:each>
				</g:if>
			</div>
			
			<div class="clear"></div>
		</div>
	</g:each>
</g:if>

	