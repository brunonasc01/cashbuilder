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
    	<g:render template="/elements/area_title" model="[bundle_key: 'menu.label.goal',class_icon:'icon-goal']"/>
    
    	<g:render template="/elements/message"></g:render>
    
		<g:if test="${deletedBean}">
    		<div class="col-1">
    			<div class="message error">
    				<g:form name="undeleteForm" action="undelete">
    					<g:hiddenField name="title" value="${deletedBean.title}"/>
    					<g:hiddenField name="startDate" value="${deletedBean.startDate}"/>
    					<g:hiddenField name="endDate" value="${deletedBean.endDate}"/>
    					<g:hiddenField name="total" value="${df.format(deletedBean.total)}"/>
    					<g:hiddenField name="finished" value="${deletedBean.finished}"/>
    					<g:hiddenField name="subcategories[0]" value="${deletedBean.subcategories[0].id}"/>

    					<p><g:link class="text_link" elementId="unDeleteLink" action="undelete"><g:message code="goal.data.delete.undo"/></g:link></p>
    				</g:form>
    			</div>
    		</div>
    	</g:if>
    
		<g:if test="${!consult_mode }">
		<aside class="mobile-only col-25">
 			<g:form name="createGoalForm" action="create">
				<g:submitButton name="newButton" class="side-button btn-action" value="${g.message(code:'form.goal.title')}" />
			</g:form>
		</aside>
		</g:if>

		<div id="content" class="col-75">
			<div class="box">
				<h3 class="title-box"><g:message code="box.goal.label.title"/></h3>
				    			
    			<div class="goal-info working">
    				<ul class="text-center">
    					<li class="title"><g:message code="box.goal.label.working"/></li>
    					<li class="value">${goalStatus[0]}</li>
    				</ul>
    			</div><div class="goal-info done">
    				<ul class="text-center">
    					<li class="title"><g:message code="box.goal.label.finished"/></li>
    					<li class="value">${goalStatus[1]}</li>
    				</ul>
    			</div><div class="goal-info lost">
    				<ul class="text-center">
    					<li class="title"><g:message code="box.goal.label.expired"/></li>
    					<li class="value">${goalStatus[2]}</li>
    				</ul>
    			</div>
			</div>

			<g:if test="${goals}">
				<div id="goal-list" class="append-top">
				<g:each var="goal" in="${goals}" status="i">
				  	<div class="box">
	            		<div class="left text-center">
	            			<ul class="stats ${goal.status }">
								<li class="date-limit">${goal.endDate }
									</li><li class="year-limit">${goal.endYear }
									</li>
								</ul>
	            		</div><div class="right">
		            			<ul class="inline">
									<li class="name">${goal.title}
									</li><li class="icon">
										<g:form action="delete">
											<g:hiddenField name="id" value="${goal.id}" />
	 										<a class="bt-icon icon-delete"></a>
										</g:form>
									</li><li class="values text-right"><g:formatNumber number="${goal.accumulated }" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
									</li><li class="of"><g:message code="default.of"/>
									</li><li class="values text-left"><g:formatNumber number="${goal.total }" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
									</li><li class="actual">
										<g:formatNumber number="${goal.currentAccumulated }" format="${Constants.FORMATO_MOEDA}"/>
										<g:message code="box.goal.this.month.message"/>
									</li><li class="progress-bar"><span style="width:${goal.barSize}%;"></span></li>
			            		</ul>
		            		</div>
				  	</div>
		  		</g:each>
		  		</div>
			</g:if>
			<g:else>
			<div class="box append-top">
				<div class="content">
					<g:message code="goal.empty.message"/>
				</div>
			</div>
			</g:else>
		</div>
		
		<g:if test="${!consult_mode }">
		<aside class="col-25">
 			<g:form name="createGoalForm" action="create">
				<g:submitButton name="newButton" class="side-button btn-action" value="${g.message(code:'form.goal.title')}" />
			</g:form>
		</aside>
		</g:if>
	</body>		
</html>
