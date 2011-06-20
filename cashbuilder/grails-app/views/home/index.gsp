<html>
    <head>
        <title>Sistema Grails</title>
        <meta name="layout" content="base" />
    </head>
    <body>
	  	<div class="span-16">
		  	
	  		<div class="box_saldo">
				avisos 150px
			</div>
			
			<hr class="space" />
				
			<g:render template="/elements/box_registro_rapido" bean="${registroRapido}" ></g:render>
	  	</div>
	  	
	  	<div class="span-8 last">
	  				  		
			<g:render template="/elements/box_saldo"  ></g:render>
	  	
	  		<hr class="space" />
	  	
	  		<g:render template="/elements/box_ultimos_pgs" bean="${ultimosRegistros }" ></g:render>
	  	</div>
	  	
	  	<div id="controllerList" class="dialog">
               <h2>Available Controllers:</h2>
               <ul>
                   <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                       <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
                   </g:each>
               </ul>
		</div>
	</body>		
</html>
