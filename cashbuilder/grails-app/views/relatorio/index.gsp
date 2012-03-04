<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <title>Sistema Grails</title>
        <meta name="layout" content="base" />
		<r:require modules="reports"/>
    </head>

    <body>
    	<div class="span-24">
			<div id="title">
    			<h3>Relatorios</h3>
    		</div>
    	</div>
    
    	<div class="span-24">
			<div id="cbox">
				<div class="title">
					Gastos Totais
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
					Distribuicao das despesas
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
					Relacao Entradas / Saidas
				</div>
				<div class="inside">
					<g:set var="chartSWF" value="${resource(dir:'fusioncharts',file:'FCF_MSColumn3D.swf')}" />
	
					<g:render template="/elements/fusioncharts/FusionChartsRenderer" model="${[
									chartSWF:chartSWF,strXML:barData,chartId:'barData',
									chartWidth:'450',chartHeight:'250']}"/>				
				</div>
			</div>
		</div>
	</body>		
</html>
