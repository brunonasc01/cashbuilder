<html>
	<head>
		<title>Index de Orcamento</title>
		<meta name="layout" content="main" />
		<link rel="stylesheet" href="<g:createLinkTo dir='css' file='orcm.css'/>" />
	</head>
	<body>
		<div class="menu">
			<div class="green">
				<div id="slatenav">
					<ul>
						<li><a href="${createLink(uri: '/home')}" title="css menus">home</a></li>
						<li><g:link controller="administracao" >Administração</g:link></li>
						<li><g:link controller="relatorio" class="current">Relatórios</g:link></li>
					</ul>
				</div>
			</div>
		</div>

		<g:form action="fluxocaixa">
			<table>
				<tbody>
					<tr class="prop">
					    <td valign="top" class="name">
					        <label for="anoId">Ano</label>
					    </td>
					    <td valign="top" class="value">
					        <g:select name="anoId"
								from="${anos}" 
								optionKey="ano" value="${params.anoId}" noSelection="['': '']" />
					    </td>
					</tr>
									
					<tr class="prop">
					    <td valign="top" class="name">
					        <label for="mesId">Mês</label>
					    </td>
					    <td valign="top" class="value">
					        <g:select name="mesId"
								from="${meses}" 
								optionKey="mes" value="${params.mesId}" noSelection="['': '']" />
					    </td>
					</tr>

					<tr>
						<td>
							<g:submitButton name="filtrar" value="Filtrar"></g:submitButton>
						</td>
					</tr>
				</tbody>
			</table>
		</g:form>

		<div class="content">
			<g:pieChart type="3d"
				title='Pagamentos no Mes'
				size="${[600,200]}"
				labels="${pgsNoMes.keySet()}"
				dataType='text'
				data="${pgsNoMes.values().asList()}">
			</g:pieChart>
			
			<g:barChart type="bvs"
				titple='Pagamentos no Mes'
				size="${[200,200]}"
				colors="${['DDFFDD'] }"
				fill="${'bg,s,efefef'}"
				axes='x,y'
				axesLabels="${
					[0:pgsNoMes.keySet(),
					 1:[0,pgsNoMes.values().max()/2,
					 pgsNoMes.values().max()]
					 ]
				}"
				dataType="simple"
				data="${pgsNoMes.values().asList()}">
			</g:barChart>
		</div>
	</body>
</html>