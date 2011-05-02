<html>
    <head>
        <title>Welcome to Grails</title>
        <meta name="layout" content="main" />
        <link rel="stylesheet" href="<g:createLinkTo dir='css' file='adm.css'/>" />
    </head>
    <body>
    	<div class="menu">
			<div class="green">
				<div id="slatenav">
					<ul>
						<li><a href="${createLink(uri: '/home')}" title="css menus">home</a></li>
						<li><g:link controller="administracao" class="current">Administração</g:link></li>
						<li><g:link controller="relatorio">Relatórios</g:link></li>
					</ul>
				</div>
			</div>
		</div>

        <div class="conteudo">
            <h1>Welcome to Grails</h1>
            <p>Congratulations, you have successfully started your first Grails application! At the moment
            this is the default page, feel free to modify it to either redirect to a controller or display whatever
            content you may choose. Below is a list of controllers that are currently deployed in this application,
            click on each to execute its default action:</p>

            <div class="controllers">
				<div class="box">
					<g:link controller="orcamento">Orçamento</g:link>
				</div>
				
				<div class="box">
					<g:link controller="orcmMes">Orçamento Mês</g:link>
				</div>
				
				<div class="box">
					<g:link controller="orcmItem">Orçamento Item</g:link>
				</div>
				
				<div class="box">
					<g:link controller="categoria">Categoria</g:link>
				</div>
				
				<div class="box">
					<g:link controller="subCategoria">Subcategoria</g:link>
				</div>
				
				<div class="box">
					<g:link controller="pagamento">Pagamento</g:link>
				</div>
            </div>
        </div>
    </body>
</html>
