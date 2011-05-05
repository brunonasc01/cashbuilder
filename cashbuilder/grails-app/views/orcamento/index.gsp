<html>
    <head>
        <title>Sistema Grails - Orcamento</title>
        <meta name="layout" content="base" />
        <link rel="stylesheet" href="<g:createLinkTo dir='css' file='orcm.css'/>" />
        
    </head>
    <body>
    	<div class="span-6">
    		<div class="box_saldo">
					menu 150px
			</div>
    	</div>
    
    	<div class="span-18 last">
		  	<div class="content">
				<g:each var="orcm" in="${orcamento}">
				<table class="tableOrcm" width="750">
					<tr class="date">
						<td width="150">
						${orcm.ano}
						</td>
		
						<g:each var="mes" in="${orcm.meses}">
							<td colspan="2">
								${mes}
							</td>
						</g:each>
					</tr>
					<tr class="header">
						<td class="header_categoria">
						CATEGORIA
						</td>
						
						<g:each in="${orcm.meses}">
							<td>PREVISTO</td>
							<td>REALIZADO</td>
						</g:each>
					</tr>
	
					<g:each var="categoria" in="${entradas}">
						<tr class="categoria_cred">
							<td>
								${categoria}
							</td>
							
							<g:each var="mes" in="${orcm.meses}">
								<td class="dado" width="50">${service.calcTotalPrevisto(mes,categoria)}</td>
								<td class="dado" width="50">${service.calcTotalRealizado(mes,categoria)}</td>
							</g:each>
						</tr>
						
						<g:each var="subcategoria" in="${categoria.subcategorias}">
							<tr class="subcategoria_cred">
								<td class="subcategoria">
									${subcategoria}
								</td>
								
								<g:each var="mes" in="${orcm.meses}">
									<g:if test="${service.possuiOrcm(mes,subcategoria)}">
										<td class="dado">${service.getValorPrevisto(mes,subcategoria)}</td>
										<td class="dado">${service.calcSubCatRealizado(mes,subcategoria)}</td>
									</g:if>
									<g:else>
										<td class="dado">0,00</td>
										<td class="dado">0,00</td>
									</g:else>
								</g:each>
							</tr>
						</g:each>
					</g:each>
	
					<g:each var="categoria" in="${saidas}">
						<tr class="categoria">
							<td>
								${categoria}
							</td>
							
							<g:each var="mes" in="${orcm.meses}">
								<td class="dado" width="50">${service.calcTotalPrevisto(mes,categoria)}</td>
								<td class="dado" width="50">${service.calcTotalRealizado(mes,categoria)}</td>
							</g:each>
						</tr>
					
						<g:each var="subcategoria" in="${categoria.subcategorias}">
							<tr>
								<td class="subcategoria">
									${subcategoria}
								</td>
								
								<g:each var="mes" in="${orcm.meses}">
									<g:if test="${service.possuiOrcm(mes,subcategoria)}">
										<td class="dado">${service.getValorPrevisto(mes,subcategoria)}</td>
										<td class="dado">${service.calcSubCatRealizado(mes,subcategoria)}</td>
									</g:if>
									<g:else>
										<td class="dado">0,00</td>
										<td class="dado">0,00</td>
									</g:else>
								</g:each>
							</tr>
						</g:each>
					</g:each>
	
					<tr class="saldo">
						
						<td class="dado">
							SALDO
						</td>
					
						<g:each var="mes" in="${orcm.meses}">
							<td class="dado">${service.calcSaldoPrevisto(mes)}</td>
							<td class="dado">${service.calcSaldoRealizado(mes)}</td>
						</g:each>
					</tr>
					
				</table>
				</g:each>
			</div>
		</div>
	</body>		
</html>
