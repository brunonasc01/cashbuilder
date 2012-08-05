<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <meta name="layout" content="base" />
        <r:require modules="info"/>
    </head>

    <body>
		<div class="span-12">
			<div class="common-text">
				<g:message code="login.failed.message1"/>
			</div>

			<div class="span-8 prepend-2">
				<div id="obox">
					<g:form action="login" method="post" class="loginForm">
						<div class="inside">
							<ul>
								<li class="label">
									<g:message code="default.email.label"/>
								</li>
								<li class="input">
									<g:textField name="email" />
								</li>
							</ul>
							
							<hr />
							
							<ul>
								<li class="label">
									<g:message code="default.password.label"/>
								</li>
								<li class="input">
									<g:passwordField name="password" />
								</li>
							</ul>
		
							<hr />
		
							<ul>
								<li class="button">
									<g:submitButton name="login" value="Entrar" />
								</li>							
							</ul>
							
							<div class="clear"> </div>
						</div>
					</g:form>
				</div>
			</div>
			<div class="clear"></div>
			
			<div class="common-text">
				<g:message code="login.falied.message2"/>
			</div>
		</div>
		
		<div class="span-12 last">
			<div class="common-text">
				<g:message code="login.falied.message3"/>
			</div>
		
			<div class="span-8 prepend-2">
				<div id="obox">
					<div class="inside center">
						<g:form controller="user" action="signup" method="post" >
							<g:submitButton name="newUser" class="singleButton" value="Cadastro" />
						</g:form>
					</div>
				</div>
			</div>
		</div>
	</body>		
</html>
