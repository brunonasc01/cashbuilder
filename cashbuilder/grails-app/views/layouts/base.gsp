<!DOCTYPE html>
<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>

        <link rel="stylesheet" href="${resource(dir:'css/blueprint',file:'screen.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css/blueprint',file:'print.css')}" />
        
		<link rel="stylesheet" href="${resource(dir:'css',file:'base.css')}" />
        <!--[if IE]>
    		<link rel="stylesheet" href="${resource(dir:'css/blueprint',file:'ie.css')}" />
  		<![endif]-->
        
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
    </head>
    <body>
    	<div class="container">
    		<div class="span-24">
    			
    			<div class="header shadow_content">
			  		<div class="logo">
			  			Logo 50px
			  		</div>
	
			  		<g:render template="/elements/subheader" ></g:render>
		  		</div>

		  		<g:render template="/elements/menu" ></g:render>

			  	<div class="span-24 content shadow_content">
					<g:layoutBody />
				</div>
	
				<div class="clear"></div>
	
			  	<g:render template="/elements/rodape" ></g:render>
		  	</div>
    	</div>
    </body>
</html>