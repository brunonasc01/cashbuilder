<!DOCTYPE html>
<html lang="pt-BR">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1.0">
	<meta name="description" content="${g.message(code:"app.description") }"/>        
	<meta name="keywords" content="${g.message(code:"app.keywords") }"/>

	<link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
	<link rel="icon" href="${resource(dir:'images',file:'favicon.png')}" />		

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

<body>
	 <section id="container" class="${wrapper_class?: 'wrapper-90' }">
		<g:layoutBody />
	 </section>
</body>
 
</html>