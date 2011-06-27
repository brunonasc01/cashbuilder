<html>
    <head>
        <title>Sistema Grails - Fluxo de Caixa</title>
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
			
			<div class="box saldo-small ui-corner-all shadow_box">
				<g:form controller="pagamento" action="novo">
					<div class="span-2">
	    				<g:submitButton name="novo" value="Novo Registro"></g:submitButton>
	    			</div>
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
