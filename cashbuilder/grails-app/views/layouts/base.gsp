<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <title><g:layoutTitle default="Grails" /></title>

		<link rel="stylesheet" href="${resource(dir:'css/blueprint',file:'screen.css')}" media="screen, projection" />
        <link rel="stylesheet" href="${resource(dir:'css/blueprint',file:'print.css')}" media="print" />
        <!--[if IE]>
    		<link rel="stylesheet" href="${resource(dir:'css/blueprint',file:'ie.css')}" media="screen, projection" />
  		<![endif]-->

		<link rel="stylesheet" href="${resource(dir:'css/custom-theme',file:'jquery-ui.css')}" />
		<link rel="stylesheet" href="${resource(dir:'css',file:'form.css')}" />
		<link rel="stylesheet" href="${resource(dir:'css',file:'layout.css')}" />

        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
		
		<g:javascript src="jquery.js" />
		<g:javascript src="jquery-ui.js" />
		<g:javascript src="funcoes-gerais.js" />
		<g:javascript src="general-effects.js" />

		<script>
			$(function() {
				$( "input:submit, button, input:reset" ).button();
			});
		</script>

        <g:layoutHead />
    </head>
    <body>
    	<div class="container">
   			<div id="header" class="span-24 append-bottom">
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
    </body>
</html>