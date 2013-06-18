<!DOCTYPE html>
<html lang="pt-BR">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1.0">        
	<meta name="keywords" content="${g.message(code:"app.keywords") }"/>

	<link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />		

	<r:layoutResources/>

	<title><g:message code="app.header"/></title>

	<g:layoutHead />
</head>

<body>
	<header>
		<g:render template="/elements/logo" ></g:render>
	
		<g:render template="/elements/subheader" ></g:render>
	</header>

	 <section class="wrapper-90">
	 	<g:render template="/elements/menu" ></g:render>

		<div class="grid">
			<g:layoutBody />
		</div>	 
	 </section>

	<footer class="text-center">
		<g:render template="/elements/rodape" ></g:render>
	</footer>

	<div class="overlay"></div>

	<div id="modal"></div>

	<r:layoutResources/>
</body>

<!-- 
<script type="text/javascript">
var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-37678976-1']);
_gaq.push(['_trackPageview']);

(function() {
  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();
</script>
 -->	
</html>