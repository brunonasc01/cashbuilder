<!DOCTYPE html>
<html lang="pt-BR">
    
<head>
	<meta name="layout" content="portal" />
	<r:require modules="portal"/>
</head>

<body>
	<div class="text-center append-bottom-dist">
		<h1 id="logo-portal"><g:message code="app.name"/></h1>

		<h3><g:message code="info.message1"/></h3>

		<g:link controller="user" action="signup" class="btn btn-large append-top-dist">COMECE AGORA</g:link>		
	</div>
	
	<section class="grid highlights">
		<div class="col-33">
			<div class="content">
				<h4><g:message code="info.box1.title"/></h4>

				<p>
					<g:message code="info.box1.message"/>  
					<a href="#"><g:message code="default.link.read_more"/></a>
				 </p>
			</div>
		</div>
			
		<div class="col-33">
			<div class="content">
				<h4><g:message code="info.box2.title"/></h4>
				<p>
					<g:message code="info.box2.message"/>  
				 </p>
			</div>
		</div>

		<div class="col-33 last">
			<div class="content">
				<h4><g:message code="info.box3.title"/></h4>
				<p>
					<g:message code="info.box3.message"/>  
				</p>
			</div>
		</div>
	</section>
</body>		
</html>