<!DOCTYPE html>
<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'menu.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
    </head>
    <body>
    	<div class="wrap">
	    	<div class="header">
	    		<h1 class="logo">CA$HBUILDER</h1>
	    	</div>
	
			<div class="main">
	    		<g:layoutBody />		
			</div>
		</div>

    	<div class="footer">
    		<p>CASHBUILDER 2011</p>
    	</div>
    </body>
</html>