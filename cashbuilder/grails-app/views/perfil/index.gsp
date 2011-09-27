<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <title>Sistema Grails</title>
        <meta name="layout" content="base" />
        
         <g:javascript>
		$(document).ready(function() {
			ajaxValidate("/cashbuilder/perfil/validator","profileForm",false);
		});
		</g:javascript>
    </head>
    <body>    
    	<p>Antes de iniciar a utilização do sistema, é preciso fornecer alguns
		dados para criação do seu perfil:</p>

		<div class="span-20">
			<g:form name="profileForm" action="save">
				<g:hiddenField name="primeiroLogin" value="false"></g:hiddenField>
			
				<fv:textInput name="nomeCompleto" />
				
				<fv:textInput name="cidade" />

				<fv:textInput name="estado" />	
				
				<fv:textInput name="pais" />

				<div class="form-label span-4">
					<label><g:message code="perfil.label" default="Perfil" /></label>
				</div>			              
				<div class="span-8 append-7 last">
					<small>Marque apenas os items que você possui</small>
				</div>

				<div class="span-6">
					<div class="">
						<g:checkBox name="animalEstimacao"></g:checkBox>
						Animal de Estimação	
					</div>
					
					<div class="">
						<g:checkBox name="automovel"></g:checkBox>
						Carro / Moto
					</div>
					
					<div class="">
						<g:checkBox name="filho"></g:checkBox>
						Filho(s)
					</div>
				</div>
				
				<div class="span-8 last">
					Marque os items com atenção. Assim o sistema poderá criar uma seleção de categorias
					fiel as suas necessidade.  
				</div>
				
				<hr class="space"></hr>
				
				<fv:submitButton name="save" class="save" value="${message(code: 'default.button.create.label', default: 'Gravar')}" />
			</g:form>
		</div>
	  	
	</body>		
</html>
