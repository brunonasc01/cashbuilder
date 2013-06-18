<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta name="layout" content="base" />
		<r:require modules="reports"/>
    </head>

    <body>
    	<g:monthMenu month="${monthIndex}" nextYear="${nextYear}" />

		<div id="month-title" class="col-1">
			<h2 class="title-box">
				<g:message code="report.title.label"/> - Mes?
				<span class="right-align">2013?</span>
			</h2>
		</div>

    	<div class="col-1">
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
										chartWidth:'600',chartHeight:'300']}"/>				
					</div>
				</div>
			</g:if>
			<g:else>
				<div id="obox">
					<div class="empty-box">
	   					<g:message code="report.empty.message"/>
	   				</div>
   				</div>
			</g:else>
		</div>
	</body>		
</html>
