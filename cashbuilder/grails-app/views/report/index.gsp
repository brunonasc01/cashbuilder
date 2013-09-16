<%@page import="com.cashbuilder.Constants"%>

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
				<g:message code="report.title.label"/> - <g:message code="${report.date.month}"/> / ${report.date.year}
			</h2>
		</div>

    	<div class="col-1">
    		<g:if test="${report.reportData.size() > 0}">
				<div class="box">
					<h3 class="title-box">
						<g:message code="report.graphic1.title.label"/>
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
										<li style="height: ${data.percent}%"></li>
									</g:each>	
								</ul>

								<ul class="labels">
									<g:each var="data" in="${report.reportData}" status="i">
										<li>${labelReference+i as char}</li>
									</g:each>
								</ul>
							</div>
							
							<div class="legends">
								<ul>
									<g:each var="data" in="${report.reportData}" status="i">
										<li><span>${labelReference+i as char}</span>${data.label}</li>
									</g:each>	
								</ul>
							</div>
						</div>
					</div>
				</div>
			</g:if>
			<g:else>
				<div class="box">
					<div class="empty-box">
	   					<g:message code="report.empty.message"/>
	   				</div>
   				</div>
			</g:else>
		</div>
	</body>		
</html>
