<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <meta name="layout" content="base" />
        <r:require module="adm"/>
    </head>
    <body>
    	<div class="span-24">
    		<g:render template="/elements/area_title" model="[bundle_key: 'manager.title.label']"/>

    		<g:if test="${flash.message}">
    			<div class="inside">
					<div class="success">
						${flash.message}
					</div>
				</div>
			</g:if>
    	</div>
    
	  	<div class="span-8">
			<div id="lbox">
				<div class="title">
					<g:message code="manager.box.title1.label"/>
				</div>
				<div class="inside">
					<ul>
						<li><g:link action="manage_budget"><g:message code="manager.box.link1.label"/></g:link></li>
					</ul>
				</div>
			</div>
	  	</div>
	  	
	  	<div class="span-8">
	  		<div id="cbox">
				<div class="title">
					<g:message code="manager.box.title2.label"/>
				</div>
				<div class="inside">
					<ul>
						<li><g:link controller="user" action="edit"><g:message code="manager.box.link2.label"/></g:link></li>
						
						<li><g:link controller="user" action="edit_mail"><g:message code="manager.box.link3.label"/></g:link></li>
						
						<li><g:link controller="user" action="edit_password"><g:message code="manager.box.link4.label"/></g:link></li>
					</ul>
				</div>
			</div>
	  	</div>
	  	
	  	<div class="span-8 last">
			<div id="rbox">
				<div class="title">
					<g:message code="manager.box.title3.label"/>
				</div>
				<div class="inside">
					<ul>
						<li><g:link controller="category" action="new_category"><g:message code="manager.box.link5.label"/></g:link></li>
					</ul>
				</div>
			</div>
	  	</div>
	</body>		
</html>