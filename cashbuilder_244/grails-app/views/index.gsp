<!DOCTYPE html>
<html lang="pt-BR">
    
<head>
	<meta name="layout" content="portal" />
	<asset:stylesheet src="portal.css"/>
	<asset:javascript src="portal.js"/>
</head>

<body>
	<div class="text-center append-bottom-dist">
		<div id="logo-portal">
			<span data-picture data-alt="<g:message code="app.name"/>">
				<span data-src="${assetPath(src:'logo_large_full.png')}"></span>
		        <span data-src="${assetPath(src:'logo_small_land.png')}" data-media="(max-width: 500px)"></span>
		        
		        <noscript>
		            <asset:image alt="${message(code:'app.name')}" src="logo_large_full.png"/>
		        </noscript>
		    </span>	
		</div>

		<h3><g:message code="landpage.subtitle"/></h3>

		<g:link controller="user" action="signup" class="btn btn-large append-top-dist"><g:message code="app.link.register_now"/></g:link>		
	</div>
	
	<section class="grid highlights">
		<div class="col-33">
			<div class="content">
				<h4><g:message code="landpage.boxleft.title"/></h4>
				<p><g:message code="landpage.boxleft.message"/>  
					<!-- <a href="#"><g:message code="landpage.link.read_more"/></a> --></p>
			</div>
		</div>
			
		<div class="col-33">
			<div class="content">
				<h4><g:message code="landpage.boxcenter.title"/></h4>
				<p><g:message code="landpage.boxcenter.message"/></p>
			</div>
		</div>

		<div class="col-33 last">
			<div class="content">
				<h4><g:message code="landpage.boxright.title"/></h4>
				<p><g:message code="landpage.boxright.message"/></p>
			</div>
		</div>
	</section>
	
	<div class="text-center">
		<ul class="inline social-bar-48">
			<li><a class="facebook-icon" href="#"></a></li>
			<li><a class="googleplus-icon" href="#" target="_blank"></a></li>
			<li><a class="twitter-icon" href="http://www.twitter.com/fazricobr" target="_blank"></a></li>
		</ul>
	</div>
</body>		
</html>