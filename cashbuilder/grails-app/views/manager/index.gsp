<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <title>Sistema Grails</title>
        <meta name="layout" content="base" />
        <r:require module="adm"/>
    </head>
    <body>
    	<div class="span-24">
			<div id="title">
    			<h3>Administracao</h3>
    		</div>

			
	    		<g:if test="${flash.message}">
	    			<div class="inside">
						<div class="success">
							${flash.message}
						</div>
					</div>
				</g:if>
			
    	</div>
    
	  	<div class="span-8">
			<div id="lbox">
				<div class="title">
					Orcamento
				</div>
				<div class="inside">
					<ul>
						<li><g:link action="manage_budget">Definir Orcamento Manual</g:link></li>
					</ul>
				</div>
			</div>
	  	</div>
	  	
	  	<div class="span-8">
	  		<div id="cbox">
				<div class="title">
					Cadastro
				</div>
				<div class="inside">
					<ul>
						<li><g:link controller="user" action="edit">Alterar dados cadastrais</g:link></li>
						
						<li><g:link controller="user" action="edit_mail">Alterar endereço de e-mail</g:link></li>
						
						<li><g:link controller="user" action="edit_password">Alterar senha de acesso</g:link></li>
					</ul>
				</div>
			</div>
	  	</div>
	  	
	  	<div class="span-8 last">
			<div id="rbox">
				<div class="title">
					Edicao de Categorias
				</div>
				<div class="inside">
					<ul>
						<li><g:link controller="category" action="new_category">Nova categoria/subcategoria</g:link></li>
					</ul>
				</div>
			</div>
	  	</div>
	</body>		
</html>