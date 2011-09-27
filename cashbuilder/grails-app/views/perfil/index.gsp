<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <title>Sistema Grails</title>
        <meta name="layout" content="base" />
        
    </head>
    <body>    
    	<p>Antes de iniciar a utilização do sistema, é preciso fornecer alguns
		dados para criação do seu perfil:</p>

		<div class="span-18">
			<g:form class="regform" controller="perfil">
				<g:hiddenField name="primeiroLogin" value="false"></g:hiddenField>
			
				<fv:textInput name="nomeCompleto" />
				
				<fv:textInput name="cidade" />

				<fv:textInput name="estado" />	
				
				<fv:textInput name="pais" />

				<div class="form-label span-4">
					<label><g:message code="perfil.label" default="Perfil" /></label>
				</div>			              
				<div class="span-8 last">
					<small>Marque apenas os items que você possui</small>
				</div>

				<div class="span-9">
	
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
				
				<div class="span-7 last">
					avisos
				</div>
				
				<hr class="space"></hr>
				
				<div class="span-5 prepend-4 append-3">
					<span class="button"><input type="submit" name="_action_save" value="Gravar" class="save" /></span>
				</div> 
			</g:form>
		</div>
	  	
	</body>		
</html>
