<html>
    <head>
        <title>Sistema Grails</title>
        <meta name="layout" content="base" />
        <g:javascript library="FusionCharts" />
    </head>

    <body>
		<div class="box ui-corner-all shadow_box">
		
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
	</body>		
</html>
