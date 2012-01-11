<%@ page import="com.cashbuilder.Usuario" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <meta name="layout" content="base" />
        
        <g:javascript base="http://cidades-estados-js.googlecode.com/files/" src="cidades-estados-1.2-utf8.js"/>
        
        <g:javascript>
		$(document).ready(function() {
			ajaxValidate("/cashbuilder/usuario/validator","editUser",true);
		});
		</g:javascript>
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
			            <g:hasErrors bean="${user}">
			            	<div class="error">
			                	<g:renderErrors bean="${user}" as="list" />
			            	</div>
			            </g:hasErrors>
					</g:else>
	
					<div class="inside">
						<g:hiddenField name="id" value="${user?.id }" />

						<ul id="field">
							<li class="label">
								<g:message code="nome.label" default=Nome" />
							</li>
							<li class="input">
								<g:textField name="nome" value="${usuario?.nome}" />
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
