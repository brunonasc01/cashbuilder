<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta name="layout" content="base" />
        <asset:stylesheet src="home.css"/>
        <asset:javascript src="system.js"/>
    </head>

    <body>
    	<g:render template="/elements/area_title" model="[bundle_key: 'menu.label.home',class_icon:'icon-home']"/>
    
    	<g:render template="/elements/message"></g:render>
    
    	<div class="line">
	  	<div class="col-75">
	  		<g:render template="/elements/box_avisos" bean="${alerts}" ></g:render>
	  	</div>
	  	
	  	<div class="col-25">
	  		<g:render template="/elements/box_saldo_home" var="bean" bean="${balanceBox}"  ></g:render>
		  	</div>
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
		
		<div class="col-25">
			<g:render template="/elements/anuncio" model="[tipo:'sidebar']"></g:render>
		</div>
	</body>		
</html>
