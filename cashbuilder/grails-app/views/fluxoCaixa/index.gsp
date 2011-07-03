<html>
    <head>
        <title>Sistema Grails - Fluxo de Caixa</title>
        <meta name="layout" content="base" />
		<link rel="stylesheet" href="<g:createLinkTo dir='css' file='cashflow.css'/>" />
    </head>
    <body>
    	<div class="span-6">
    		<div class="box new-reg ui-corner-all shadow_box">
    			<g:link controller="pagamento" action="novo" >
					<img src="${resource(dir:'images',file:'add-icon.png')}"/>
					<br />Orçamento
				</g:link>
			</div>
    	
    		<div class="box saldo-csflow ui-corner-all shadow_box">
    			<h5>Totais (R$)</h5>
    		
				<div class="title span-2">Entradas</div>
				<div class="span-3 last">
					<span class="positivo">+</span>
					<g:formatNumber number="${fluxoCaixa.entradas}" format="###,###,##0.00"></g:formatNumber>
				</div>
				
				<div class="title span-2">Saídas</div>
				<div class="span-3 last">
					<span class="negativo">-</span>
					<g:formatNumber number="${fluxoCaixa.saidas}" format="###,###,##0.00"></g:formatNumber>
				</div>
				
				<g:set var="classSaldo" value="${(fluxoCaixa.saldo > 0) ? 'positivo' : 'negativo' }"></g:set>
				
				<div class="title span-2">Saldo</div>
				<div class="span-3 ${classSaldo } last">
					<g:formatNumber number="${fluxoCaixa.saldo}" format="###,###,##0.00"></g:formatNumber>
				</div>
			</div>
    	
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
    	</div>
    
    	<div class="box ui-corner-all span-16 last shadow_box">
    		<g:if test="${flash.message}">
				<div class="notice">
					${flash.message}
				</div>
			</g:if>
    	
    		<g:render template="/elements/fluxocaixa_detalhado" bean="${fluxoCaixa}"></g:render>
		</div>
	</body>		
</html>
