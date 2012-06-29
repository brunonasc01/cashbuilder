<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <meta name="layout" content="base" />
        <r:require modules="info"/>
    </head>
    <body>
		<div class="info-text">
			<g:message code="info.message1"/>
			
			<g:form controller="user" action="signup" method="post" >
				<g:submitButton name="newUser" class="singleButton" value="Comece agora" />
			</g:form>

			<hr />
		</div>
		
		<ul class="info-box">
			<li>
				<b><g:message code="info.box1.title"/></b> 
				<br />
				<g:message code="info.box1.message"/> 
				<br />
				<a href="#"><g:message code="default.link.read_more"/></a>
			</li>
			
			<li>
				<b><g:message code="info.box2.title"/></b> 
				<br />
				<g:message code="info.box2.message"/> 
			</li>
			
			<li>
				<b><g:message code="info.box3.title"/></b> 
				<br />
				<g:message code="info.box3.message"/> 
			</li>
		</ul>
		
		<div class="clear"></div>
		
		<div class="span-8" id="dialog">
			<div id="popup">			
				<g:form action="login" controller="login" method="post" class="loginForm" name="loginForm" id="loginForm" >
					<div class="title popup-title-border">
						LOGIN
					</div>
					
					<div class="inside">
						<ul>
							<li class="label">
								<g:message code="email.label" default="Email" />
							</li>
							<li class="input">
								<g:textField name="email" />
							</li>
						</ul>
						
						<hr />
						
						<ul class="password">
							<li class="label">
								<g:message code="password.label" default="Senha" />
							</li>
							<li class="input">
								<g:passwordField name="password" />
							</li>
							<li class="lostpassword">
								<small><a>esqueci a senha<a/></small>
							</li>
						</ul>
	
						<hr />
	
						<ul>
							<li class="button">
								<input type="submit" name="login" value="Entrar" id="login" />
							</li>							
						</ul>
						
						<div class="clear"> </div>
						
						<!--<ul>
							<li class="message">
								
							</li>
						</ul>-->
						
						<div class="clear"></div>
					</div>
				</g:form>
			</div>
		</div>
	</body>		
</html>
