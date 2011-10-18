<%@page import="com.cashbuilder.utils.Constants"%>

<g:if test="${list}">	
	<g:each var="orcm" in="${list}">
		<div class="categoria">
			<p class="rotulo">${orcm.nome }</p>

			<div id="orcm-Basic">
				<div id="orcm-item" class="span-16">
					<div class="btplus span-1">
						<span>+</span>
					</div>

					<g:hiddenField name="prevVal" value="${orcm.valorPrevisto }"/>
					<g:hiddenField name="realVal" value="${orcm.valorRealizado }"/>
					
					<div  class="atual span-3">
						<g:formatNumber number="${orcm.valorRealizado }" format="${Constants.FORMATO_MOEDA}"/>
					</div>
					<div class="span-9">
						<div id="progressbar"></div>
					</div>
					<div class="previsto span-3 last">
						<g:formatNumber number="${orcm.valorPrevisto }" format="${Constants.FORMATO_MOEDA}"/>
					</div>
				</div>
				
				<g:if test="${orcm.subcategorias}">
					<div id="list-detail" class="subcategoria span-14">
						<g:each var="orcmFilho" in="${orcm.subcategorias}">
							<p class="rotulo">${orcmFilho.nome }</p>
							
							<div id="orcm-subitem">
								<g:hiddenField name="prevVal" value="${orcmFilho.valorPrevisto }"/>
								<g:hiddenField name="realVal" value="${orcmFilho.valorRealizado }"/>
								
								<div class="atual span-3">
									<g:formatNumber number="${orcmFilho.valorRealizado }" format="${Constants.FORMATO_MOEDA}"/>
								</div>
								<div class="span-8">
									<div id="progressbar"></div>
								</div>
								<div class="previsto span-3 last">
									<g:formatNumber number="${orcmFilho.valorPrevisto }" format="${Constants.FORMATO_MOEDA}"/>
								</div>
							</div>
						</g:each>
					</div>
				</g:if>
			</div>
		</div>
	</g:each>
</g:if>

	