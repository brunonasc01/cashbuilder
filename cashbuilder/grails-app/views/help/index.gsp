<%@page import="com.cashbuilder.Constants"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <meta name="layout" content="base" />
        <r:require modules="core"/>
        
        <g:javascript>
        	$(function() {
				processAnswers('helpContent');
			});
        </g:javascript>
    </head>

    <body>
    	<g:render template="/elements/area_title" model="[bundle_key: 'help.title.label']"/>
		<g:message code=""/>
		
		<div id="helpContent" class="helpList">
		
	  	<div class="span-12">
			<div id="lbox">
				<div class="title">
					<span class="info-icon"><g:message code="help.general.title"/></span>
				</div>
				<div class="inside">
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
	  	
		<div class="span-12 last">
			<div id="rbox">
				<div class="title">
					<g:message code="help.technical.title"/>
				</div>
				<div class="inside">
					<ul>
						<li><a href="#"><g:message code="help.technical.lostpassword"/></a></li>
						<li><a href="#"><g:message code="help.technical.bugs"/></a></li>
						<li><a href="#"><g:message code="help.technical.feedback"/></a></li>
					</ul>
				</div>
			</div>
	  	</div>
		
	  	<div class="span-12">
	  		<div id="lbox">
				<div class="title">
					<g:message code="help.home.title"/>
				</div>
				<div class="inside">
					<ul>
						<li><span><g:message code="help.home.ask1.title"/></span><p><g:message code="help.home.ask1.answer"/></p></li>
						<li><span><g:message code="help.home.ask2.title"/></span><p><g:message code="help.home.ask2.answer"/></p></li>
						<li><span><g:message code="help.home.ask3.title"/></span><p><g:message code="help.home.ask3.answer"/></p></li>
					</ul>
				</div>
			</div>
	  	</div>
	  	
		<div class="span-12 last">
	  		<div id="rbox">
				<div class="title">
					<g:message code="help.budget.title"/>
				</div>
				<div class="inside">
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
	  	
		<div class="span-12">
	  		<div id="lbox">
				<div class="title">
					<g:message code="help.cashflow.title"/>
				</div>
				<div class="inside">
					<ul>
						<li><span><g:message code="help.cashflow.ask1.title"/></span><p><g:message code="help.cashflow.ask1.answer"/></p></li>
						<li><span><g:message code="help.cashflow.ask2.title"/></span><p><g:message code="help.cashflow.ask2.answer"/></p></li>
						<li><span><g:message code="help.cashflow.ask3.title"/></span><p><g:message code="help.cashflow.ask3.answer"/></p></li>
						<li><span><g:message code="help.cashflow.ask4.title"/></span><p><g:message code="help.cashflow.ask4.answer"/></p></li>
					</ul>
				</div>
			</div>
	  	</div>
		
		<div class="span-12 last">
	  		<div id="rbox">
				<div class="title">
					<g:message code="help.goal.title"/>
				</div>
				<div class="inside">
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
	
		<div class="span-12">
	  		<div id="lbox">
				<div class="title">
					<g:message code="help.report.title"/>
				</div>
				<div class="inside">
					<ul>
						<li><span><g:message code="help.report.ask1.title"/></span><p><g:message code="help.report.ask1.answer"/></p></li>
					</ul>
				</div>
			</div>
	  	</div>
		
		<div class="span-12 last">
	  		<div id="rbox">
				<div class="title">
					<g:message code="help.admin.title"/>
				</div>
				<div class="inside">
					<ul>
						<li><span><g:message code="help.admin.ask1.title"/></span><p><g:message code="help.admin.ask1.answer"/></p></li>
					</ul>
				</div>
			</div>
	  	</div>
	  	
	  	</div>
	</body>		
</html>
