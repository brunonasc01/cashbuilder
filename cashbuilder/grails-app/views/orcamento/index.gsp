<%@page import="com.cashbuilder.utils.Constants"%>
<html>
    <head>
        <title>Sistema Grails - Orcamento</title>
        <meta name="layout" content="base" />
        <link rel="stylesheet" href="<g:createLinkTo dir='css' file='orcm.css'/>" />
        
    </head>
    <body>
    	<div class="span-6">
    		<div class="box ui-corner-all shadow_box">
	    		<g:form action="index">
	    			<fieldset>
	            		<legend>Filtro</legend>
	    				
	    				<div class="form-label span-1">
	    					<label for="anoId">Ano</label>
	    				</div>
	
	    				<div class="span-3 last">
		    				<g:select name="anoId"
								from="${anos}" 
								optionKey="ano" value="${params.anoId}" noSelection="['': 'Sel.']" />
						</div>		
	    		
	    				<div class="form-label span-1">
	    					<label for="mesId">Mes</label>
	    				</div>
	
	    				<div class="span-3 last">
		    				<g:select name="mesId"
								from="${meses}" 
								optionKey="mes" value="${params.mesId}" noSelection="['': 'Sel.']" />
						</div>
	    		
	    				<div class="span-2 prepend-1">
	    					<g:submitButton name="filtrar" value="Filtrar"></g:submitButton>
	    				</div>
	    			</fieldset>
				</g:form>
			</div>
			
			<g:if test="${boxSaldo }">
				<div class="box saldo-orcm ui-corner-all shadow_box">
					<h5>Saldo (R$)</h5>

					<g:set var="classPrevisto" value="${(boxSaldo.saldoPrevisto > 0) ? 'positivo' : 'negativo' }"></g:set>

					<div class="title span-2">Previsto</div>
					<div class="span-2 ${classPrevisto } last">
						<g:formatNumber number="${boxSaldo.saldoPrevisto }" format="${Constants.moneyMask}"/>
					</div>
					
					<g:set var="classRealizado" value="${(boxSaldo.saldoRealizado > 0) ? 'positivo' : 'negativo' }"></g:set>
					
					<div class="title span-2">Realizado</div>
					<div class="span-2 ${classRealizado } last">
						<g:formatNumber number="${boxSaldo.saldoRealizado }" format="${Constants.moneyMask}"/>
					</div>
				</div>
			</g:if>
    	</div>
    
    	<div class="box ui-corner-all span-16 last shadow_box">
    		<g:render template="/elements/orcamento_detalhado" bean="${orcamento}"></g:render>
		</div>
	</body>		
</html>
