<%@page import="com.cashbuilder.Constants"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta name="layout" content="base" />
        <r:require modules="goal"/>
        
        <g:javascript>
        initGoalScripts();
        </g:javascript>
    </head>

    <body>
    	<g:render template="/elements/area_title" model="[bundle_key: 'goal.title.label']"/>
    
    	<g:render template="/elements/message"></g:render>
    
	  	<div class="col-25">
	  		<g:if test="${!consult_mode }">
		  		<div class="text-center append-bottom-dist">
	  				<g:form name="createGoalForm" action="create">
						<g:submitButton name="newButton" class="btn btn-large" value="Nova Meta" />
					</g:form>
				</div>
			</g:if>

			<div class="box">
				<h3 class="title-box"><g:message code="goal.box.title.label"/></h3>
				    			
    			<div id="goal-info" class="content">
    				<ul class="inline">
    					<li class="title"><g:message code="goal.box.goal1.label"/></li>
    					<li class="value">${goalStatus[0]}</li>
    				</ul>
    				<ul class="inline">
    					<li class="title"><g:message code="goal.box.goal2.label"/></li>
    					<li class="value">${goalStatus[1]}</li>
    				</ul>
    				<ul class="inline">
    					<li class="title"><g:message code="goal.box.goal3.label"/></li>
    					<li class="value">${goalStatus[2]}</li>
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
										<g:message code="goal.status.${goal.status}.label"/>
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
									</li><li class="of"><g:message code="default.of"/>
									</li><li class="values text-left"><g:formatNumber number="${goal.total }" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
									</li><li class="actual">
										<g:formatNumber number="${goal.currentAccumulated }" format="${Constants.FORMATO_MOEDA}"/>
										<g:message code="goal.this.month.message"/>
									</li><li class="progress-bar"><span style="width:${goal.barSize}%;"></span></li>
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
