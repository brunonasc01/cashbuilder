<html>
    <head>
        <title>Sistema Grails - Orcamento</title>
        <meta name="layout" content="base" />
        <link rel="stylesheet" href="<g:createLinkTo dir='css' file='orcm.css'/>" />
        
    </head>
    <body>
    	<div class="span-6">
    		<g:form action="index">
    			<fieldset>
            		<legend>Filtro</legend>
    				
    				<div class="span-1">
    					<label for="anoId">Ano</label>
    				</div>

    				<div class="span-4 last">
	    				<g:select name="anoId"
							from="${anos}" 
							optionKey="ano" value="${params.anoId}" noSelection="['': 'Sel.']" />
					</div>		
    		
    				<div class="span-1">
    					<label for="mesId">Mes</label>
    				</div>

    				<div class="span-4 last">
	    				<g:select name="mesId"
							from="${meses}" 
							optionKey="mes" value="${params.mesId}" noSelection="['': 'Sel.']" />
					</div>
    		
    				<div class="span-2">
    					<g:submitButton name="filtrar" value="Filtrar"></g:submitButton>
    				</div>
    			</fieldset>
			</g:form>
			
			<div class="span-3">
				Saldo Previsto
			</div>
			
			<div class="span-3 last">
				${saldoPrevisto }
			</div>
			
			<div class="span-3">
				Saldo Realizado
			</div>
			
			<div class="span-3 last">
				${saldoRealizado }
			</div>
    	</div>
    
    	<div class="span-18 last">
    		<g:render template="/elements/orcamento_detalhado" bean="${orcamento}"></g:render>
		</div>
	</body>		
</html>
