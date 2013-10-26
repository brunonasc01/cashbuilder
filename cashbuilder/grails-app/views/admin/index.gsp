<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta name="layout" content="base" />
        <r:require module="adm"/>
        
        <g:javascript>
		initAdminScripts();
		</g:javascript>
    </head>
    <body>
   		<g:render template="/elements/area_title" model="[bundle_key: 'manager.title.label']"/>

   		<g:render template="/elements/message"></g:render>

		<g:if test="${!consult_mode }">
		  	<div class="col-33">
				<div class="box">
					<h3 class="title-box"><g:message code="manager.box.title1.label"/></h3>
					
					<div class="content">
						<ul class="list-items">
							<li><g:link action="manage_budget"><g:message code="manager.box.link1.label"/></g:link></li>
						</ul>
					</div>
				</div>
		  	</div>
		  	
		  	<div class="col-33">
		  		<div class="box">
		  			<h3 class="title-box"><g:message code="manager.box.title2.label"/></h3>
	
					<div class="content">
						<ul class="list-items">
							<li><g:link elementId="edit_user_link"  controller="user" action="edit"><g:message code="manager.box.link2.label"/></g:link></li>
							
							<li><g:link elementId="edit_mail_link" controller="user" action="edit_mail"><g:message code="manager.box.link3.label"/></g:link></li>
							
							<li><g:link elementId="edit_password_link" controller="user" action="edit_password"><g:message code="manager.box.link4.label"/></g:link></li>
						</ul>
					</div>
				</div>
		  	</div>
		  	
		  	<div class="col-33">
				<div class="box">
					<h3 class="title-box"><g:message code="manager.box.title3.label"/></h3>
	
					<div class="content">
						<ul class="list-items">
							<li><g:link controller="category" action="new_category"><g:message code="manager.box.link5.label"/></g:link></li>
						</ul>
					</div>
				</div>
		  	</div>
	  	</g:if>
	  	
	  	<g:if test="${!yearsList.empty }">
	  	<div class="col-33">
			<div class="box">
				<h3 class="title-box"><g:message code="manager.historic.title.label"/></h3>

				<div class="content">
					<ul class="list-items">
						<li>
							<g:if test="${consult_mode }">
								<p><g:message code="manager.historic.form.consult.message"/></p>
							
								<hr />
							
								<div class="content-center">
									<g:form method="post" action="reset_consult">	
										<div class="content-center">
											<g:submitButton name="reset" class="btn" value="Retornar" />
										</div>
								</g:form>
								</div>
							</g:if>
							<g:else>
								<p><g:message code="manager.historic.form.message"/></p>
 		
								<hr />
							
								<g:form method="post" action="consult_legacy">
									<label for="ano">Ano
									</label>
									<g:select name="consult_year"
										from="${yearsList }" noSelection="['': 'Selecione']" />
										
										<div class="content-center">
												<g:submitButton name="consult" class="btn" value="Consultar" />
										</div>
								</g:form>
							</g:else>
						</li>
					</ul>
				</div>
			</div>
	  	</div>
	  	</g:if>
	</body>		
</html>