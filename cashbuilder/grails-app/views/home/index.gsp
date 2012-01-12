<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <title>Sistema Grails</title>
        <meta name="layout" content="base" />
    </head>

    <body>
	  	<div class="span-16">
	  		<g:render template="/elements/box_avisos" bean="${alerts}" ></g:render>

			<g:render template="/elements/box_registro_rapido" bean="${registroRapido}" ></g:render>
			
			<div class="clear"></div>
	  	</div>
	  	
	  	<div class="span-8 last">
	  		<div id="rbox">
				<g:render template="/elements/box_saldo" var="bean" bean="${balanceBox}"  ></g:render>
			</div>

	  		<g:render template="/elements/box_registros_recentes" bean="${ultimosRegistros }" ></g:render>
	  	</div>
	</body>		
</html>
