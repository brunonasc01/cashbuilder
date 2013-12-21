<%@page import="com.cashbuilder.Constants"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta name="layout" content="base" />
        <r:require modules="help"/>

        <g:javascript>
		$(function() {
			processAnswers('help-list');
		});
        </g:javascript>
    </head>

    <body>
    	<g:render template="/elements/area_title" model="[bundle_key: 'help.title.label',class_icon:'icon-help']"/>

		<div id="help-list" class="grid">
			<div class="col-33">
				<div class="box">
					<h3 class="title-box"><g:message code="help.technical.title"/></h3>
					
					<div class="content">
						<ul>
							<li><a href="#"><g:message code="help.technical.lostpassword"/></a></li>
							<li><a href="#"><g:message code="help.technical.bugs"/></a></li>
							<li><a href="#"><g:message code="help.technical.feedback"/></a></li>
						</ul>
					</div>
				</div>
		  	</div>
			
			<div class="col-1">
				<div class="box">
					<h3 class="title-box"><g:message code="help.general.title"/></h3>
					
					<div class="content">
						<ul>
							<li><span><g:message code="help.general.ask1.title"/></span><p><g:message code="help.general.ask1.answer"/></p></li>
							<li><span><g:message code="help.general.ask2.title"/></span><p><g:message code="help.general.ask2.answer"/></p></li>
							<li><span><g:message code="help.general.ask3.title"/></span><p><g:message code="help.general.ask3.answer"/></p></li>
							<li><span><g:message code="help.general.ask4.title"/></span><p><g:message code="help.general.ask4.answer"/></p></li>
							<li><span><g:message code="help.general.ask5.title"/></span><p><g:message code="help.general.ask5.answer"/></p></li>
						</ul>
					</div>
				</div>
		  	</div>
			
		  	<div class="col-1">
		  		<div class="box">
		  			<h3 class="title-box"><g:message code="help.home.title"/></h3>
	
					<div class="content">
						<ul>
							<li><span><g:message code="help.home.ask1.title"/></span><p><g:message code="help.home.ask1.answer"/></p></li>
							<li><span><g:message code="help.home.ask2.title"/></span><p><g:message code="help.home.ask2.answer"/></p></li>
							<li><span><g:message code="help.home.ask3.title"/></span><p><g:message code="help.home.ask3.answer"/></p></li>
						</ul>
					</div>
				</div>
		  	</div>
		  	
			<div class="col-1">
		  		<div class="box">
		  			<h3 class="title-box"><g:message code="help.budget.title"/></h3>
	
					<div class="content">
						<ul>
							<li><span><g:message code="help.budget.ask1.title"/></span><p><g:message code="help.budget.ask1.answer"/></p></li>
							<li><span><g:message code="help.budget.ask2.title"/></span><p><g:message code="help.budget.ask2.answer"/></p></li>
							<li><span><g:message code="help.budget.ask3.title"/></span><p><g:message code="help.budget.ask3.answer"/></p></li>
							<li><span><g:message code="help.budget.ask4.title"/></span><p><g:message code="help.budget.ask4.answer"/></p></li>
							<li><span><g:message code="help.budget.ask5.title"/></span><p><g:message code="help.budget.ask5.answer"/></p></li>
						</ul>
					</div>
				</div>
		  	</div>
		  	
			<div class="col-1">
		  		<div class="box">
		  			<h3 class="title-box"><g:message code="help.cashflow.title"/></h3>
	
					<div class="content">
						<ul>
							<li><span><g:message code="help.cashflow.ask1.title"/></span><p><g:message code="help.cashflow.ask1.answer"/></p></li>
							<li><span><g:message code="help.cashflow.ask2.title"/></span><p><g:message code="help.cashflow.ask2.answer"/></p></li>
							<li><span><g:message code="help.cashflow.ask3.title"/></span><p><g:message code="help.cashflow.ask3.answer"/></p></li>
							<li><span><g:message code="help.cashflow.ask4.title"/></span><p><g:message code="help.cashflow.ask4.answer"/></p></li>
						</ul>
					</div>
				</div>
		  	</div>
			
			<div class="col-1">
		  		<div class="box">
		  			<h3 class="title-box"><g:message code="help.goal.title"/></h3>
	
					<div class="content">
						<ul>
							<li><span><g:message code="help.goal.ask1.title"/></span><p><g:message code="help.goal.ask1.answer"/></p></li>
							<li><span><g:message code="help.goal.ask2.title"/></span><p><g:message code="help.goal.ask2.answer"/></p></li>
							<li><span><g:message code="help.goal.ask3.title"/></span><p><g:message code="help.goal.ask3.answer"/></p></li>
							<li><span><g:message code="help.goal.ask4.title"/></span><p><g:message code="help.goal.ask4.answer"/></p></li>
							<li><span><g:message code="help.goal.ask5.title"/></span><p><g:message code="help.goal.ask5.answer"/></p></li>
						</ul>
					</div>
				</div>
		  	</div>
		
			<div class="col-1">
		  		<div class="box">
		  			<h3 class="title-box"><g:message code="help.report.title"/></h3>
	
					<div class="content">
						<ul>
							<li><span><g:message code="help.report.ask1.title"/></span><p><g:message code="help.report.ask1.answer"/></p></li>
						</ul>
					</div>
				</div>
		  	</div>
			
			<div class="col-1">
		  		<div class="box">
		  			<h3 class="title-box"><g:message code="help.admin.title"/></h3>
	
					<div class="content">
						<ul>
							<li><span><g:message code="help.admin.ask1.title"/></span><p><g:message code="help.admin.ask1.answer"/></p></li>
						</ul>
					</div>
				</div>
		  	</div>
	  	</div>
	</body>		
</html>
