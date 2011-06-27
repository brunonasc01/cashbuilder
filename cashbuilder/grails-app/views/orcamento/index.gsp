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
			
			<div class="box saldo-small ui-corner-all shadow_box">
				<div class="span-3">
					Saldo Previsto
				</div>
				
				<div class="span-2 last">
					${saldoPrevisto }
				</div>
				
				<div class="span-3">
					Saldo Realizado
				</div>
				
				<div class="span-2 last">
					${saldoRealizado }
				</div>
			</div>
    	</div>
    
    	<div class="box ui-corner-all span-16 last shadow_box">
    		<g:render template="/elements/orcamento_detalhado" bean="${orcamento}"></g:render>
		</div>
	</body>		
</html>
