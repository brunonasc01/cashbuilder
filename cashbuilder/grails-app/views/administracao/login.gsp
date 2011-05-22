<html>
    <head>
        <title>Sistema Grails</title>
        <meta name="layout" content="base" />
        
    </head>
    <body>
	  	<div class="span-24">
		  	
		  		<g:if test="${flash.message}">
				<div class="flash">
					${flash.message}
				</div>
			</g:if>
			
			<g:form action="valida_login" controller="administracao">
				<table>
					<tbody>
						<tr class="prop">
						    <td valign="top" class="name">
						        <label for="email">E-mail</label>
						    </td>
						    <td valign="top" class="value">
						        <g:textField name="email" maxlength="20" value="" />
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
