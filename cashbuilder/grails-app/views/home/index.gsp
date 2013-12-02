<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta name="layout" content="base" />
        <r:require modules="home"/>
    </head>

    <body>
    	<g:render template="/elements/message"></g:render>
    
	  	<div class="col-75">
	  		<g:render template="/elements/box_avisos" bean="${alerts}" ></g:render>
	  	</div>
	  	
	  	<div class="col-25">
	  		<g:render template="/elements/box_saldo" var="bean" bean="${balanceBox}"  ></g:render>
	  	</div>

		<g:if test="${!consult_mode}">
		<div class="col-25">
			<g:render template="/elements/cashflow_transaction_create_box" bean="${registroRapido}" ></g:render>
		</div>
		</g:if>
			
		<div class="col-25">
			<g:render template="/elements/box_registros_recentes" bean="${ultimosRegistros}" ></g:render>
		</div>
		
		<div class="col-25">
			<g:render template="/elements/box_registros_futuros" var="list" bean="${registrosFuturos}" ></g:render>
		</div>
	</body>		
</html>
