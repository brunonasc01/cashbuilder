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
		<div id="login-bar" class="text-right">
			<g:form action="login" controller="login" method="post" class="login">
				<label><g:message code="default.email.label"/>
				</label><g:textField name="email" />

				<label><g:message code="default.password.label"/>
				</label><g:passwordField name="password" />

				<input type="submit" class="btn btn-small" value="OK"/>
			</g:form>
		</div>
	</header>

	 <section class="wrapper-90">
		<g:layoutBody />
	 </section>

	<footer class="text-center">
		<g:render template="/elements/rodape" ></g:render>
	</footer>

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