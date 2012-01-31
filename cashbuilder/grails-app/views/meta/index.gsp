<%@page import="com.cashbuilder.utils.Constants"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <title>Sistema Grails</title>
        <meta name="layout" content="base" />
        <link rel="stylesheet" href="<g:createLinkTo dir='css' file='goal.css'/>" />
        <link rel="stylesheet" href="<g:createLinkTo dir='css' file='modalform.css'/>" />
        
        <g:javascript>
        	$(document).ready(function() {
				ajaxModal("linkNovaMeta","/cashbuilder/meta/ajaxNovo","popupNovo",
				"${message(code: 'meta.novo.title', default: 'Novo')}");
			});
        </g:javascript>
    </head>

    <body>
    	<div class="span-24">
			<div id="title">
    			<h3>Metas</h3>
    		</div>
    	</div>
    
	  	<div class="span-7">
	  		<div id="lbox">
    			<g:link elementId="linkNovaMeta" action="novo" >
					Nova Meta
				</g:link>
			</div>
			
			<div id="lbox">
				<div class="title">
    				Estatisticas
    			</div>
    			
    			<div id="goalBox" class="inside">
    				<ul>
    					<li class="label">
    						Metas em Andamento
    					</li>
    					<li class="value">
    						${goalResults[0]}
    					</li>
    					<li class="label">
    						Metas Alcancadas
    					</li>
    					<li class="value">
    						${goalResults[1]}
    					</li>
    					<li class="label">
    						Metas Expiradas
    					</li>
    					<li class="value">
    						${goalResults[2]}
    					</li>
    				</ul>
    				<div class="clear"></div>
    			</div>
			</div>
	  	</div>

	  	<div class="span-17 last">
			<div id="rbox">
				<div class="inside">
	            <g:if test="${metas }">
	            	<g:set var="prog" value="${0}" />
	            
	            	<g:each var="meta" in="${metas}">
	            	<div id="goal">
	            		<ul>
	            			<li class="name">${meta.nome }</li>
	            			<li class="state">
		            			<g:if test="${meta.status == Constants.META_ATINGIDA }">
									<i>ALCANCADO!</i>
								</g:if>
								<g:elseif test="${meta.status == Constants.META_PERDIDA }">
									<i>EXPIRADO</i>
								</g:elseif>
								<g:elseif test="${meta.status == Constants.META_CORRENTE }">
									<i>EM ANDAMENTO</i>
								</g:elseif>
							</li>
							<li class="values">
								<g:formatNumber number="${meta.valorAcumulado }" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
							</li>
							
							<li class="of"> de </li>
							
							<li class="values">
								<g:formatNumber number="${meta.valorFinal }" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
							</li>
							
							<li class="space">&nbsp;</li>
							
							<li class="bar">
								<div id="progressbar${prog }"></div>
								
								<script type="text/javascript">
								$(function() {
									$( "#progressbar${prog }" ).progressbar({
										value: ${meta.porcentagem}
									});
								});
								</script>
							</li>
	            		</ul>
	            		<g:set var="prog" value="${prog + 1}" />
	            	</div>
	            	<div class="clear"></div>
	            	</g:each>
	            </g:if>
	            </div>
            </div>
	  	</div>
	  	
	  	<div id="popupNovo" class=""></div>
	</body>		
</html>
