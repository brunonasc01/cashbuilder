<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <meta name="layout" content="base" />
		<r:require modules="reports"/>
    </head>

    <body>
    	<div class="span-24">
			<div id="title" class="rounded-all">
    			<h3><g:message code="report.title.label"/></h3>
    		</div>
    	</div>
    
    	<div class="span-24">
    		<g:if test="${!emptyReport }">
				<div id="cbox">
					<div class="title">
						<g:message code="report.graphic1.title.label"/>
					</div>
					<div class="inside">
						<g:set var="chartSWF" value="${resource(dir:'fusioncharts',file:'FCF_Column3D.swf')}" />
		
						<g:render template="/elements/fusioncharts/FusionChartsRenderer" model="${[
									chartSWF:chartSWF,strXML:columnData,chartId:'columnData',
									chartWidth:'900',chartHeight:'250']}"/>		
					</div>
				</div>
				
				<div id="cbox">
					<div class="title">
						<g:message code="report.graphic2.title.label"/>
					</div>
					<div class="inside">
						<g:set var="chartSWF" value="${resource(dir:'fusioncharts',file:'FCF_Pie2D.swf')}" />
		
						<g:render template="/elements/fusioncharts/FusionChartsRenderer" model="${[
									chartSWF:chartSWF,strXML:pieData,chartId:'pieChart',
									chartWidth:'450',chartHeight:'250']}"/>
					</div>
				</div>
				
				<div id="cbox">
					<div class="title">
						<g:message code="report.graphic3.title.label"/>
					</div>
					<div class="inside">
						<g:set var="chartSWF" value="${resource(dir:'fusioncharts',file:'FCF_MSColumn3D.swf')}" />
		
						<g:render template="/elements/fusioncharts/FusionChartsRenderer" model="${[
										chartSWF:chartSWF,strXML:barData,chartId:'barData',
										chartWidth:'450',chartHeight:'250']}"/>				
					</div>
				</div>
			</g:if>
			<g:else>
				<div id="rbox">
					<div class="empty-box">
	   					<g:message code="report.empty.message"/>
	   				</div>
   				</div>
			</g:else>
		</div>
	</body>		
</html>
