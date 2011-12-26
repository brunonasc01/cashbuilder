<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <title>Sistema Grails</title>
        <meta name="layout" content="base" />
        <link rel="stylesheet" href="<g:createLinkTo dir='css' file='reports.css'/>" />
        <g:javascript library="FusionCharts" />
    </head>

    <body>
    	<div class="span-24">
			<div id="title">
    			<h3>Relatorios</h3>
    		</div>
    	</div>
    
    	<div class="span-24">
			<div id="cbox">
			
				<g:set var="chartSWF" value="${resource(dir:'fusioncharts',file:'FCF_Pie2D.swf')}" />
	
				<g:render template="/elements/fusioncharts/FusionChartsRenderer" model="${[
							chartSWF:chartSWF,strXML:pieData,chartId:'pieChart',
							chartWidth:'500',chartHeight:'300']}"/>
	
	
				<g:set var="chartSWF" value="${resource(dir:'fusioncharts',file:'FCF_MSColumn3D.swf')}" />
	
				<g:render template="/elements/fusioncharts/FusionChartsRenderer" model="${[
							chartSWF:chartSWF,strXML:barData,chartId:'barData',
							chartWidth:'500',chartHeight:'300']}"/>				
							
				<g:set var="chartSWF" value="${resource(dir:'fusioncharts',file:'FCF_MSLine.swf')}" />
	
				<g:render template="/elements/fusioncharts/FusionChartsRenderer" model="${[
							chartSWF:chartSWF,strXML:lineData,chartId:'lineData',
							chartWidth:'500',chartHeight:'300']}"/>
			</div>
		</div>
	</body>		
</html>
