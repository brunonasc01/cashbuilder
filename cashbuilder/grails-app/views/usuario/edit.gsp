<%@ page import="com.cashbuilder.Usuario" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <meta name="layout" content="base" />

		<g:dgCidadesEstados estado="estado" estado_valor="${usuario?.perfil?.estado}" 
			cidade="cidade" cidade_valor="${usuario?.perfil?.cidade}" />
		<g:validateForm controller="usuario" form="editUser" action="editValidator" />
    </head>
    
    <body>
    	<div class="span-24">
			<div id="title">
    			<h3>Cadastro</h3>
    		</div>
    	</div>
    
    	<div class="span-24">
		  	<div id="obox">
				<g:form class="userForm" name="editUser" action="update" >
					<div class="title">
						Meus Dados
					</div>
				
					<g:if test="${flash.message}">
						<div class="notice">
							${flash.message}
						</div>
					</g:if>
			  		<g:else>
			            <g:hasErrors bean="${usuario}">
			            	<div class="error">
			                	<g:renderErrors bean="${usuario}" as="list" />
			            	</div>
			            </g:hasErrors>
					</g:else>
	
					<div class="inside">
						<g:hiddenField name="id" value="${usuario?.id }" />

						<ul id="field">
							<li class="label">
								<g:message code="nome.label" default="Nome" />
							</li>
							<li class="input">
								<g:textField name="nome" value="${usuario?.nome}" />
							</li>
							<li class="message"></li>
						</ul>
						
						<div class="clear"></div>
						
						<ul id="field">
							<li class="label">
								<g:message code="nomeCompleto.label" default="Nome Completo" />
							</li>
							<li class="input">
								<g:textField name="perfil.nomeCompleto" value="${usuario?.perfil?.nomeCompleto}" />
							</li>
							<li class="message"></li>
						</ul>
	
						<div class="clear"></div>

						<ul id="field">
							<li class="label">
								<g:message code="estado.label" default="Estado" />
							</li>
							<li class="input">
								<input type="text" name="perfil.estado" id="estado" value="${usuario?.perfil?.estado}"/>
							</li>
							<li class="message"></li>
						</ul>
						
						<div class="clear"></div>
						
						<ul id="field">
							<li class="label">
								<g:message code="cidade.label" default="Cidade" />
							</li>
							<li class="input">
								<input type="text" name="perfil.cidade" id="cidade" value="${usuario?.perfil?.cidade}"/>
							</li>
							<li class="message"></li>
						</ul>
						
						<div class="clear"></div>
	
						<ul id="field">
							<li class="label">
								<g:message code="pais.label" default="Pais" />
							</li>
							<li class="input">
								<g:textField name="perfil.pais" value="${usuario?.perfil?.pais}"/>
							</li>
							<li class="message"></li>
						</ul>

						<div class="clear"></div>

						<ul id="submitField">
							<li class="button">
								<g:submitButton name="create" class="save" value="Gravar" />
							</li>
							<li class="message"></li>
						</ul>
	
						<div class="clear"></div>
	            	</div>
	            </g:form>
		  	</div>
	  	</div>
	  	<div class="clear"></div>
	</body>		
</html>
