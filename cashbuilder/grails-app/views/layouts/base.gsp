<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <title><g:layoutTitle default="CASHBUILDER" /></title>

        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />		
		<r:require modules="core"/>
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

			<div id="footer" class="span-24">
		  		<g:render template="/elements/rodape" ></g:render>
		  	</div>
    	</div>
    	
    	<r:layoutResources/>
    </body>
</html>