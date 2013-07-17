<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta name="layout" content="base" />
        <r:require module="adm"/>
        
        <g:javascript>
        $(function() {
        	ajaxLinkToModal('edit_user_link','modal')
        	
        	enableCloseOverlay();
        });
		</g:javascript>
    </head>
    <body>
   		<g:render template="/elements/area_title" model="[bundle_key: 'manager.title.label']"/>

   		<g:if test="${flash.message}">
   			<div class="col-100 last">
				<div class="message error">
					${flash.message}
				</div>
			</div>
		</g:if>
    
	  	<div class="col-33">
			<div class="box">
				<h3 class="title-box"><g:message code="manager.box.title1.label"/></h3>
				
				<div class="content">
					<ul>
						<li><g:link action="manage_budget"><g:message code="manager.box.link1.label"/></g:link></li>
					</ul>
				</div>
			</div>
	  	</div>
	  	
	  	<div class="col-33">
	  		<div class="box">
	  			<h3 class="title-box"><g:message code="manager.box.title2.label"/></h3>

				<div class="content">
					<ul>
						<li><g:link elementId="edit_user_link"  controller="user" action="edit"><g:message code="manager.box.link2.label"/></g:link></li>
						
						<li><g:link controller="user" action="edit_mail"><g:message code="manager.box.link3.label"/></g:link></li>
						
						<li><g:link controller="user" action="edit_password"><g:message code="manager.box.link4.label"/></g:link></li>
					</ul>
				</div>
			</div>
	  	</div>
	  	
	  	<div class="col-33">
			<div class="box">
				<h3 class="title-box"><g:message code="manager.box.title3.label"/></h3>

				<div class="content">
					<ul>
						<li><g:link controller="category" action="new_category"><g:message code="manager.box.link5.label"/></g:link></li>
					</ul>
				</div>
			</div>
	  	</div>
	</body>		
</html>