<%@page import="com.cashbuilder.Constants"%>

<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta name="layout" content="base" />
		<r:require modules="reports"/>
    </head>

    <body>
		<div class="area-title col-1">
			<h2 class="title-box icon-reports">
				<g:message code="menu.label.report"/> - <g:message code="month.${monthIndex}"/> / ${report.date.year}
			</h2>
		</div>
		
		<g:monthMenu month="${monthIndex}" nextYear="${nextYear}" />
		
		<g:render template="/elements/message"></g:render>

		<g:if test="${report.reportData.size() == 0 && distribReport.reportData.size() == 0}">
			<div class="col-1">
				<div class="box">
					<div class="content">
						<g:message code="report.empty.message"/>
					</div>
				</div>
			</div>
		</g:if>
		<g:else>
	    	<div id="vertical-graph" class="col-1">
				<div class="box">
					<h3 class="title-box">
						<g:message code="report.graph.expenses.title"/>
					</h3>
					<div class="content">
						<div class="v-chart clearfix">
							<div class="scale">
								<ul>
									<g:each var="scale" in="${report.reportScale}">
										<li><g:formatNumber number="${scale }" currencySymbol="" format="${Constants.FORMATO_MOEDA}"></g:formatNumber></li>
									</g:each>	
								</ul>
							</div>
	
							<div class="data">
								<ul class="bars">
									<g:each var="data" in="${report.reportData}">
										<li style="height: ${data.percent}%">
											<div class="data-popup"><g:formatNumber number="${data.total}" currencySymbol="" format="${Constants.FORMATO_MOEDA}"></g:formatNumber></div>
										</li>
									</g:each>	
								</ul>
	
								<ul class="labels">
									<g:each var="data" in="${report.reportData}" status="i">
											<li><g:customLabel value="${data.label}" prefix="label"/></li>
									</g:each>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-1">
				<div class="box">
					<h3 class="title-box">
						<g:message code="report.graph.percent.title"/>
					</h3>
					<div class="content">
						<div class="h-chart clearfix">
							<div>
								<ul>
									<g:each var="data" in="${distribReport.reportData}">
										<li><g:customLabel value="${data.label}" prefix="label"/>
										</li><li>
											<span style="width: ${data.percent}%">&nbsp;</span><span>${data.percent}%</span>
										</li>
									</g:each>
								</ul>
							</div>	
						</div>
					</div>
				</div>
			</div>
		</g:else>
	</body>		
</html>
