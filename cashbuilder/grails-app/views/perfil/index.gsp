<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <title>Sistema Grails</title>
        <meta name="layout" content="base" />
        
    </head>
    <body>    
    	<p>Antes de iniciar a utilização do sistema, é preciso fornecer alguns
		dados para criação do seu perfil:</p>

		<div class="span-14">
			<g:form class="regform" controller="perfil">
				<g:hiddenField name="primeiroLogin" value="false"></g:hiddenField>
			
				<div class="form-label span-4">
					<label for="nomeCompleto"><g:message code="perfil.nomeCompleto" default="Nome Completo" /></label>
				</div>			              
				<div class="span-5 append-3 last">
					<g:textField size="45" maxlength="50" name="nomeCompleto" value="" />
				</div>
				
				<div class="form-label span-4">
					<label for="cidade"><g:message code="perfil.cidade" default="Cidade" /></label>
				</div>			              
				<div class="span-5 append-3 last">
					<g:textField size="20" maxlength="20" name="cidade" value="" />
				</div>
				
				<div class="form-label span-4">
					<label for="estado"><g:message code="perfil.estado" default="Estado" /></label>
				</div>			              
				<div class="span-5 append-3 last">
					<g:textField size="20" maxlength="20" name="estado" value="" />
				</div>
				
				<div class="form-label span-4">
					<label for="pais"><g:message code="perfil.pais" default="País" /></label>
				</div>			              
				<div class="span-5 append-3 last">
					<g:textField size="20" maxlength="20" name="pais" value="" />
				</div>
				
				<div class="form-label span-4">
					<label for="perfil"><g:message code="perfil.perfil" default="Perfil" /></label>
					
				</div>			              
				<div class="span-8 last">
					<small>Marque apenas os items que você possui</small>
				</div>
	
				<div class="span-5 prepend-4 append-3">
					<g:checkBox name="animalEstimacao"></g:checkBox>
					Animal de Estimação	
				</div>
				
				<div class="span-5 prepend-4 append-3">
					<g:checkBox name="automovel"></g:checkBox>
					Carro / Moto
				</div>
				
				<div class="span-5 prepend-4 append-3">
					<g:checkBox name="filho"></g:checkBox>
					Filho(s)
				</div>
				
				<hr class="space"></hr>
				
				<div class="span-5 prepend-4 append-3">
					<span class="button"><input type="submit" name="_action_save" value="Gravar" class="save" /></span>
				</div> 
			</g:form>
		</div>
	  	
	</body>		
</html>
