<!DOCTYPE html>
<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'base.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css/blueprint',file:'screen.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css/blueprint',file:'print.css')}" />
        <!--[if IE]>
    		<link rel="stylesheet" href="${resource(dir:'css/blueprint',file:'ie.css')}" />
  		<![endif]-->
        
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
    </head>
    <body>
    	<div class="container showgrid">
    		<div class="span-24">
		  		<div class="logo">
		  		Logo 50px
		  		</div>

		  		<g:render template="/elements/subheader" ></g:render>

		  		<g:render template="/elements/menu" ></g:render>
		  	</div>
		  	
		  	<hr class="space" />
		  	
			<g:layoutBody />
			
			<hr class="space" />

		  	<g:render template="/elements/rodape" ></g:render>
    	</div>
    </body>
</html>