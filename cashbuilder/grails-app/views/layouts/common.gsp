<!DOCTYPE html>
<html lang="pt-BR">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1.0">        
	<meta name="keywords" content="${g.message(code:"app.keywords") }"/>

	<link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
	<link rel="icon" href="${resource(dir:'images',file:'favicon.png')}" />		

	<r:layoutResources/>

	<title><g:message code="app.title"/></title>

	<g:layoutHead />
	
	<script type="text/javascript">

	  var _gaq = _gaq || [];
	  _gaq.push(['_setAccount', 'UA-37678976-1']);
	  _gaq.push(['_setDomainName', 'fazrico.com.br']);
	  _gaq.push(['_setAllowLinker', true]);
	  _gaq.push(['_trackPageview']);
	
	  (function() {
	    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	  })();
	</script>
</head>

<body class="light-background">
	<header>
		<nav class="mobile-menu">
			<ul>
				<li><g:link controller="about" action="."><g:message code="app.link.oque_e"/></g:link></li>
				<li><g:link controller="about" action="."><g:message code="app.link.como_funciona"/></g:link></li>					
				<li><g:link url="http://blog.fazrico.com"><g:message code="app.link.blog"/></g:link></li>	
				<li><g:link controller="login"><g:message code="app.link.login"/></g:link></li>
				<li><g:link controller="user" action="signup"><g:message code="app.link.signup_2"/></g:link></li>
			</ul>
		</nav>
		<div class="wrapper-90">
			<g:render template="/elements/logo" ></g:render>
	
			<div class="right-align">
				<nav class="menu">
					<g:link controller="about" action="."><g:message code="app.link.oque_e"/></g:link>
					<g:link controller="about" action="."><g:message code="app.link.como_funciona"/></g:link>					
					<g:link url="http://blog.fazrico.com"><g:message code="app.link.blog"/></g:link>					
					<g:link controller="login" class="btn"><g:message code="app.link.login"/></g:link>
					<g:link controller="user" action="signup" class="btn"><g:message code="app.link.signup_2"/></g:link>
				</nav>
				<button id="toggle-navbar" class="mobile-only toggle-navbar">
					<span class="line-bar"></span>
					<span class="line-bar"></span>
					<span class="line-bar"></span>
				</button>
			</div>
		</div>
	</header>

	 <section id="container" class="${wrapper_class?: 'wrapper-90' }">
		<div class="grid">
			<g:layoutBody />
		</div>	 
	 </section>

	<footer class="text-center">
		<g:render template="/elements/rodape" model="[showCommon:true]"></g:render>
	</footer>
	
	<r:layoutResources/>
</body>

</html>