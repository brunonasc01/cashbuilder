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
				<div class="box">
					<h3 class="title-box">
						<g:message code="report.graphic1.title.label"/>
					</h3>
					<div class="content">
						<div class="v-chart clearfix">
							<div class="scale">
								<ul>
									<g:each var="scale" in="${reportScale}">
										<li>${scale }</li>
									</g:each>	
								</ul>
							</div>

							<div class="data">
								<ul class="bars">
									<g:each var="data" in="${reportData}">
										<li style="height: ${data.percent}%"></li>
									</g:each>	
								</ul>

								<ul class="labels">
									<g:each var="data" in="${reportData}">
										<li>${data.label}</li>
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
