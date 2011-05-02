<html>
    <head>
        <title>Welcome to Grails</title>
        <meta name="layout" content="main" />
    </head>
    <body>
    
    	<div class="menu">
			<div class="green">
				<div id="slatenav">
					<ul>
						<li><g:link controller="usuario" action="registro">Novo Usuário</g:link></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="conteudo">
			<g:if test="${flash.message}">
				<div class="flash">
					${flash.message}
				</div>
			</g:if>
			
			<g:form action="autenticacao" controller="login">
				<table>
					<tbody>
						<tr class="prop">
						    <td valign="top" class="name">
						        <label for="userId">User</label>
						    </td>
						    <td valign="top" class="value">
						        <g:textField name="userId" maxlength="20" value="" />
						    </td>
						</tr>
						
						<tr class="prop">
						    <td valign="top" class="name">
						        <label for="password">Senha</label>
						    </td>
						    <td valign="top" class="value">
						        <g:passwordField name="password" maxlength="8" value="" />
						    </td>
						</tr>
						
						<tr>
							<td>
								<g:submitButton name="login" value="Login"></g:submitButton>
							</td>
						</tr>
					</tbody>
				</table>
			</g:form>
		</div>
    </body>
</html>
