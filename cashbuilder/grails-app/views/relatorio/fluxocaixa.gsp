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
			<table class="tableOrcm" width="750">
				<tr class="date">
					<td>Data</td>
					<td>Entrada</td>
					<td>Saída</td>
					<td>Saldo</td>
					<td>Categoria</td>
					<td>Descrição</td>
				</tr>

				<g:each var="pg" in="${pagamentos}">
					<tr>
						<td class="dado">${pg.data.day}</td>

						<td class="dado">
							<g:if test="${pg.natureza.equals('C')}">
							${pg.valor}
							</g:if>
						</td>						

						<td class="dado">
							<g:if test="${pg.natureza.equals('D')}">
								${pg.valor}
							</g:if>
						</td>

						<td class="dado">0,00</td>
						
						<td class="dado">${pg.subcategoria}</td>
						
						<td>${pg.descricao}</td>
					</tr>
				</g:each>

				<tr class="saldo">
					<td class="dado">TOTAL</td>

					<td class="dado">${service.calcTotal(mes,session.user,true) }</td>

					<td class="dado">${service.calcTotal(mes,session.user,false) }</td>
					
					<td class="dado">${service.calcSaldo(mes,session.user) }</td>
					
					<td class="dado"></td>
					
					<td class="dado"></td>
				</tr>
			</table>
		</div>
	</body>
</html>