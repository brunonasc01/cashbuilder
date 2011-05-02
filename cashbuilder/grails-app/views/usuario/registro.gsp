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
						<li><g:link controller="login">Login</g:link></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="conteudo">
			<g:form action="gravacao">
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
						
						<tr class="prop">
						    <td valign="top" class="name">
						        <label for="password">Repita a Senha</label>
						    </td>
						    <td valign="top" class="value">
						        <g:passwordField name="passwordRepeat" maxlength="8" value="" />
						    </td>
						</tr>
						
						<tr class="prop">
						    <td valign="top" class="name">
						        <label for="email">E-Mail</label>
						    </td>
						    <td valign="top" class="value">
						        <g:textField name="email" value="" />
						    </td>
						</tr>
						
						<tr>
							<td>
								<g:submitButton name="gravar" value="Gravar"></g:submitButton>
							</td>
						</tr>
					</tbody>
				</table>
			</g:form>
		</div>
    </body>
</html>
