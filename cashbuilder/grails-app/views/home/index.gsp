<!DOCTYPE html>
<html lang="pt-BR">
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
