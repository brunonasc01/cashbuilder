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
    		<g:if test="${result}">
    			<h2>${result.ano }</h2>
    			<h3>${result.mes }</h3>
    			
    			<g:each var="orcm" in="${result.items}">
    				
    				<div>
    					<b>${orcm.categoria}</b>
    				</div>
    				
    			</g:each>
    		</g:if>
		</div>
	</body>		
</html>
