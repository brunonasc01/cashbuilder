<%@page import="com.cashbuilder.utils.Constants"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <title>Sistema Grails</title>
        <meta name="layout" content="base" />
        
        <g:javascript>
        	$(document).ready(function() {
				ajaxModal("linkNovaMeta","/cashbuilder/meta/ajaxNovo","popupNovo");
			});
        </g:javascript>
    </head>

    <body>
	  	<div class="span-6">
	  		<div class="box new-reg ui-corner-all shadow_box">
    			<g:link elementId="linkNovaMeta" action="novo" >
					<p>Nova Meta</p>
				</g:link>
			</div>
	  	</div>
	  	
	  	<div id="popupNovo" class="box registro_rapido ui-corner-all shadow_box modal">
    		
		</div>
	  	
	  	<div class="box ui-corner-all span-16 last shadow_box">

            <g:set var="prog" value="${0}" />
            
            <g:if test="${metas }">
            	<g:each var="meta" in="${metas}">
            		<div class="meta span-15">
	            		<div class="title span-10">${meta.nome }</div>

						<div class="status span-5 last">
						
						<g:if test="${meta.status == Constants.META_ATINGIDA }">
							<i class="positivo">ALCANCADO!</i>
						</g:if>
						<g:elseif test="${meta.status == Constants.META_PERDIDA }">
							<i class="negativo">EXPIRADO</i>
						</g:elseif>
						<g:elseif test="${meta.status == Constants.META_CORRENTE }">
							<i>EM ANDAMENTO</i>
						</g:elseif>
						</div>

						<div class="span-15 append-5">
		            		<b>R$ <g:formatNumber number="${meta.valorAcumulado }" format="${Constants.FORMATO_MOEDA}"></g:formatNumber></b>
		            		de
		            		<b>R$ <g:formatNumber number="${meta.valorFinal }" format="${Constants.FORMATO_MOEDA}"></g:formatNumber></b>
	            		</div>
	            		
	            		<div class="span-15">
	            			<div id="progressbar${prog }"></div>
	            		</div>

	            		<script type="text/javascript">
						$(function() {
							$( "#progressbar${prog }" ).progressbar({
								value: ${meta.porcentagem}
							});
						});
						</script>
	            		
						<g:set var="prog" value="${prog + 1}" />
					</div>
            	</g:each>
            </g:if>
	  	
	  	</div>
	</body>		
</html>
