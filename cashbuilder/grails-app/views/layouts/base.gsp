<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <title><g:message code="app.header"/></title>
        <meta name="keywords" content="${g.message(code:"app.keywords") }"/>

        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />		
		
		<r:layoutResources/>

		<script>
		styleButtons();
		</script>

        <g:layoutHead />
    </head>
    <body>
    	<div class="container">
   			<div id="header" class="span-24 append-bottom prepend-top">
		  		<g:render template="/elements/logo" ></g:render>

		  		<g:render template="/elements/subheader" ></g:render>
	  		</div>

			<div class="clear"></div>

			<div id="menubar" class="span-24">
	  			<g:render template="/elements/menu" ></g:render>
	  		</div>

		  	<div id="content" class="span-24 append-bottom">
				<g:layoutBody />
			</div>

			<div class="clear"></div>

			<div id="footer" class="span-24 append-bottom">
		  		<g:render template="/elements/rodape" ></g:render>
		  	</div>
    	</div>
    	
    	<r:layoutResources/>
    </body>
    <div class="mascara"/></div>
    
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
</html>