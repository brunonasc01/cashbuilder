<%@page import="com.cashbuilder.Constants"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta name="layout" content="base" />
        <r:require modules="goal"/>
        
        <g:javascript>
        	
        </g:javascript>
    </head>

    <body>
    	<g:render template="/elements/area_title" model="[bundle_key: 'goal.title.label']"/>
    
    	<g:if test="${flash.message}">
    		<div class="col-1">
				<div class="message info">
					${flash.message}
				</div>
			</div>
		</g:if>
    
	  	<div class="col-25">
	  		<div class="text-center append-bottom-dist">
  				<g:form action="newGoal">
					<g:submitButton name="newButton" class="btn btn-large" value="Nova Meta" />
				</g:form>
			</div>

			<div class="box">
				<h3 class="title-box"><g:message code="goal.box.title.label"/></h3>
				    			
    			<div id="goal-info" class="content">
    				<ul class="inline">
    					<li class="title">
    						<g:message code="goal.box.goal1.label"/>
    					</li>
    					<li class="value">
    						${goalStatus[0]}
    					</li>
    				</ul>
    				<ul class="inline">
    					<li class="title">
    						<g:message code="goal.box.goal2.label"/>
    					</li>
    					<li class="value">
    						${goalStatus[1]}
    					</li>
    				</ul>
    				<ul class="inline">
    					<li class="title">
    						<g:message code="goal.box.goal3.label"/>
    					</li>
    					<li class="value">
    						${goalStatus[2]}
    					</li>
    				</ul>
    			</div>
			</div>
	  	</div>

		<div class="col-66">
		<g:if test="${goals}">
			<div id="goal-list">
				<g:each var="goal" in="${goals}" status="i">
				  	<div class="box append-bottom-dist">
						<div class="content clearfix">
		            		<div class="left left-align">
		            			<ul class="stats">
									<li class="status">
										<g:if test="${goal.status == Constants.META_ATINGIDA }">
											<g:message code="goal.status.done.label"/>
										</g:if>
										<g:elseif test="${goal.status == Constants.META_PERDIDA }">
											<g:message code="goal.status.lost.label"/>
										</g:elseif>
										<g:elseif test="${goal.status == Constants.META_CORRENTE }">
											<g:message code="goal.status.working.label"/>
										</g:elseif>
									</li><li class="date-limit">${goal.endDate }
									</li><li class="year-limit">${goal.endYear }
									</li>
								</ul>
		            		</div>
			            		
		            		<div class="right left-align">
		            			<ul class="inline">
									<li class="name">${goal.title}
									</li><li class="icon">
										<g:form action="delete">
											<g:hiddenField name="id" value="${goal.id}" />
	 										<a href="#"><span class="ui-icon ui-icon-trash"></span></a>
										</g:form>
									</li><li class="values text-right"><g:formatNumber number="${goal.accumulated }" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
									</li><li class="of">de
									</li><li class="values text-left"><g:formatNumber number="${goal.total }" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
									</li><li class="actual">
										<g:formatNumber number="${goal.currentAccumulated }" format="${Constants.FORMATO_MOEDA}"/>
										<g:message code="goal.this.month.message"/>
									</li><li class="progress-bar"><span style="width:25%;"></span></li>
			            		</ul>
		            		</div>
			            </div>
				  	</div>
		  		</g:each>
		  	</div>
		</g:if>
		<g:else>
			<div class="box">
				<div class="content">
					<g:message code="goal.empty.message"/>
				</div>
			</div>
		</g:else>
		</div>
	</body>		
</html>
