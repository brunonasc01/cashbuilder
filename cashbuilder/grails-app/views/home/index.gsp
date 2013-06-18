<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <meta name="layout" content="base" />
        <r:require modules="core"/>
    </head>

    <body>
	  	<div class="col-75">
	  		<g:render template="/elements/box_avisos" bean="${alerts}" ></g:render>
	  	</div>
	  	
	  	<div class="col-25">
	  		<g:render template="/elements/box_saldo" var="bean" bean="${balanceBox}"  ></g:render>
	  	</div>

		<div class="col-25">
			<g:render template="/elements/box_registro_rapido" bean="${registroRapido}" ></g:render>
		</div>
			
		<div class="col-25">
			<g:render template="/elements/box_registros_recentes" bean="${ultimosRegistros }" ></g:render>
		</div>
	</body>		
</html>
