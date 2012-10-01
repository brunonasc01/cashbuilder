<%@page import="com.cashbuilder.Constants"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <meta name="layout" content="base" />
        <r:require modules="goal"/>
        
        <g:javascript>
        	$(function() {
				ajaxSubmitToModal('newButton','dialog');
			});
        </g:javascript>
    </head>

    <body>
    	<g:render template="/elements/area_title" model="[bundle_key: 'goal.title.label']"/>
    
    	<g:if test="${flash.message}">
    		<div class="span-24">
				<div class="form-errors-large">
					${flash.message}
				</div>
			</div>
		</g:if>
    
	  	<div class="span-7">
	  		<div id="lbox">
	  			<div class="inside center">
		  			<g:form action="newGoal">
						<g:submitButton name="newButton" class="boxButton" value="Nova Meta" />
					</g:form>
				</div>
			</div>
			
			<div id="lbox">
				<div class="title">
    				<g:message code="goal.box.title.label"/>
    			</div>
    			
    			<div id="goalBox" class="inside">
    				<ul>
    					<li class="label">
    						<g:message code="goal.box.goal1.label"/>
    					</li>
    					<li class="value">
    						${goalStatus[0]}
    					</li>
    					<li class="label">
    						<g:message code="goal.box.goal2.label"/>
    					</li>
    					<li class="value">
    						${goalStatus[1]}
    					</li>
    					<li class="label">
    						<g:message code="goal.box.goal3.label"/>
    					</li>
    					<li class="value">
    						${goalStatus[2]}
    					</li>
    				</ul>
    				<div class="clear"></div>
    			</div>
			</div>
	  	</div>

		<g:if test="${goals}">
			<g:each var="goal" in="${goals}" status="i">
			  	<div class="span-17 last">
					<div id="rbox">
						<div class="inside">
				           
		            		<div class="left">
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
									</li>
									
									<li class="date-limit">
										${goal.endDate }
									</li>
										
									<li class="year-limit">
										${goal.endYear }
									</li>
								</ul>
		            		</div>
		            		
		            		<div class="right">
		            			<ul class="progress">
									<li class="name">${goal.title}</li>
			            			
									<li class="icon">
										<g:form action="delete">
											<g:hiddenField name="id" value="${goal.id}" />
<!-- 											<span class="ui-icon ui-icon-trash"></span></a> -->
											
											<input type="submit" name="delete" class="bt_delete2 ui-icon ui-icon-trash" value="" title="excluir" onclick="return confirm('Tem Certeza?');" />
										</g:form>
									</li>
									
									<li class="values">
										<g:formatNumber number="${goal.accumulated }" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
									</li>
									
									<li class="of">de</li>
									
									<li class="values">
										<g:formatNumber number="${goal.total }" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
									</li>
									
									<li class="actual">
										<g:formatNumber number="${goal.currentAccumulated }" format="${Constants.FORMATO_MOEDA}"/>
										<g:message code="goal.this.month.message"/>
									</li>
									
									<li class="bar">
										<div id="progressbar${i}"></div>
									
										<script type="text/javascript">
										$(function() {
											$( "#progressbar${i}" ).progressbar({
												value: ${goal.percent}
											});
										});
										</script>
									</li>
			            		</ul>
		            		</div>
		            		<div class="clear"></div>
			            </div>
		            </div>
			  	</div>
	  		</g:each>
		</g:if>
		<g:else>
			<div class="span-17 last">
				<div id="rbox">
					<div class="empty-box">
						<g:message code="goal.empty.message"/>
					</div>
				</div>
			</div>
		</g:else>
		
		<div class="span-16" id="dialog">
			<div id="popup">	
		
			</div>
		</div>
	</body>		
</html>
