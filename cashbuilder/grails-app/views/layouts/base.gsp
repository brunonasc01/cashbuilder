<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <title><g:layoutTitle default="Grails" /></title>

        <link rel="stylesheet" href="${resource(dir:'css/blueprint',file:'screen.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css/blueprint',file:'print.css')}" />
        <!--[if IE]>
    		<link rel="stylesheet" href="${resource(dir:'css/blueprint',file:'ie.css')}" />
  		<![endif]-->
        
		<link rel="stylesheet" href="${resource(dir:'css',file:'base.css')}" />
		<link rel="stylesheet" href="${resource(dir:'css/custom-theme',file:'jquery-ui-1.8.13.custom.css')}" />
        
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
		
		<g:javascript src="jquery-1.5.1.min.js" />
        <g:javascript src="jquery-ui-1.8.13.custom.min.js" />

		<script type="text/javascript">
			$(function() {
				$( "input:submit, button, input:reset" ).button();
			});
		</script>

        <g:layoutHead />

        <g:javascript library="application" />
        
    </head>
    <body>
    	<div class="container">
   			<div class="header">
		  		<g:render template="/elements/logo" ></g:render>

		  		<g:render template="/elements/subheader" ></g:render>
	  		</div>

	  		<g:render template="/elements/menu" ></g:render>

		  	<div class="span-24 content ui-corner-bottom">
		  		<div class="content-inner-space">
					<g:layoutBody />
				</div>
			</div>

			<div class="clear"></div>

		  	<g:render template="/elements/rodape" ></g:render>
    	</div>
    </body>
</html>