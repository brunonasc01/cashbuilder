<!DOCTYPE html>
<html lang="pt-BR">
    
<head>
	<meta name="layout" content="portal" />
	<r:require modules="portal"/>
</head>

<body>
	<div class="text-center append-bottom-dist">
		<div id="logo-portal">
			<span data-picture data-alt="<g:message code="app.name"/>">
				<span data-src="${resource(dir:'images',file:'logo_large_full.png')}"></span>
		        <span data-src="${resource(dir:'images',file:'logo_small_full.png')}" data-media="(max-width: 500px)"></span>
		        
		        <noscript>
		            <img alt="<g:message code="app.name"/>" src="${resource(dir:'images',file:'logo_large_full.png')}"/>
		        </noscript>
		    </span>	
		</div>

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
	
	<div class="text-center">
		<ul class="inline social-bar-48">
			<li>
				<a class="facebook-icon" href="#"></a>
			</li>

			<li>
				<a class="twitter-icon" href="http://www.twitter.com/fazricobr" target="_blank"></a>
			</li>
		</ul>
	</div>
</body>		
</html>