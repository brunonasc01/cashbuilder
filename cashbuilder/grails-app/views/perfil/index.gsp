<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <title>Sistema Grails</title>
        <meta name="layout" content="base" />
        
		<g:javascript base="http://cidades-estados-js.googlecode.com/files/" src="cidades-estados-1.2-utf8.js"/>
        
		<g:javascript>
		$(document).ready(function() {
			new dgCidadesEstados({
			    estado: $('#estado').get(0),
			    cidade: $('#cidade').get(0),
			    change: true
			  });
		
			ajaxValidate("/cashbuilder/perfil/validator","profileForm",true);
			
			$('#cidade').addClass("sel_city");
		});
		</g:javascript>
    </head>
    <body>    
    	<div id="obox">
    		<div class="title">
    			Cadastro de Perfil
    		</div>
    		
    		<div class="inside">
		    	<p>Antes de iniciar a utilização do sistema, é preciso fornecer alguns
				dados para criação do seu perfil:</p>

				<g:form class="userForm" name="profileForm" action="save">
					<g:hiddenField name="primeiroLogin" value="false"></g:hiddenField>
				
					<ul id="field">
						<li class="label">
							<g:message code="nomeCompleto.label" default="Nome Completo" />
						</li>
						<li class="input">
							<g:textField name="nomeCompleto" />
						</li>
						<li class="message"></li>
					</ul>
				
					<div class="clear"></div>
				
					<ul id="field">
						<li class="label">
							<g:message code="estado.label" default="Estado" />
						</li>
						<li class="input">
							<g:textField name="estado" />
						</li>
						<li class="message"></li>
					</ul>
					
					<div class="clear"></div>
					
					<ul id="field">
						<li class="label">
							<g:message code="cidade.label" default="Cidade" />
						</li>
						<li class="input">
							<g:textField name="cidade" />
						</li>
						<li class="message"></li>
					</ul>
					
					<div class="clear"></div>

					<ul id="field">
						<li class="label">
							<g:message code="pais.label" default="Pais" />
						</li>
						<li class="input">
							<g:textField name="pais" value="Brasil"/>
						</li>
						<li class="message"></li>
					</ul>
						
					<div class="clear"></div>
						
					<ul id="field">
						<li class="label">
							<g:message code="despesas.label" default="Despesas" />
						</li>
						<li class="input">
							<small>(Marque apenas os items que você possui)</small>
							
							<ul>
								<li>
									<g:checkBox name="animalEstimacao"></g:checkBox>
									Animal de Estimação
								</li>
								<li>
									<g:checkBox name="automovel"></g:checkBox>
									Carro / Moto
								</li>
								<li>
									<g:checkBox name="filho"></g:checkBox>
									Filho(s)
								</li>
							</ul>
						</li>
						<li class="message">
							Marque as despesas com atenção. Assim o sistema poderá criar uma seleção de categorias
						fiel as suas necessidades.  
						</li>
					</ul>
										
					<div class="clear"></div>
					
					<ul id="submitField">
						<li class="button">
							<g:submitButton name="save" class="save" value="Gravar" />
						</li>
						<li class="message"></li>
					</ul>
					
					<div class="clear"></div>
				</g:form>
			</div>
	  	</div>
	  	<div class="clear"></div>
	</body>		
</html>
