<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <meta name="layout" content="base" />
    </head>
    
    <body>
    	<div class="span-24">
			<div id="title">
    			<h3>Edicao de Categorias</h3>
    		</div>
    	</div>
    
    	<div class="span-24">
		  	<div id="obox">
				<g:form class="userForm" name="new_category" controller="categoria" >
					<div class="title">
						Nova Categoria
					</div>
				
					<g:if test="${flash.message}">
						<div class="notice">
							${flash.message}
						</div>
					</g:if>
			  		<g:else>
			            <g:hasErrors bean="${categoria}">
			            	<div class="error">
			                	<g:renderErrors bean="${categoria}" as="list" />
			            	</div>
			            </g:hasErrors>
					</g:else>
	
					<div class="inside">
						<g:hiddenField name="custom" value="${categoria?.custom }" />

						<ul id="field">
							<li class="label">
								<g:message code="categoria.nome.label" default="Nome" />
							</li>
							<li class="input field-space">
								<g:textField name="nome" value="${categoria?.nome }" />
							</li>
							<li class="message"></li>
						</ul>

						<div class="clear"></div>

						<ul id="field">
							<li class="label">
								<g:message code="categoria.receita.label" default="Receita" />
							</li>
							<li class="input field-space">
								<g:checkBox name="receita" value="${categoria?.receita }" />
								<small id="parcel_msg">marque para categorias do tipo Entrada</small>
							</li>
							<li class="message"></li>
						</ul>
	
						<div class="clear"></div>
						
						<g:if test="${categoria.subcategorias}" >
							<ul>
								<li class="label">
									<g:message code="subcategorias.label" default="Subcategorias" />
								</li>
								<li class="input field-space">
									<input type="submit" name="_action_add_subcategory" class="save" value="Adicionar Subcategoria" />
								</li>
							</ul>
							<div class="clear"></div>
						
							<g:set var="counter" value="${0}" />

							<g:each var="subcategoria" in="${categoria.subcategorias.sort{it.nome}}">
								<ul id="field">
									<li class="label">
										<g:message code="subcategoria.nome.label" default="Nome" />
									</li>
									<li class="input field-space">
										<g:textField name="subcategorias[${counter}].nome" value="${subcategoria.nome }"></g:textField>
									</li>
									<li class="message"></li>
								</ul>
								<div class="clear"></div>
								<g:set var="counter" value="${counter + 1}" />
							</g:each>
						</g:if>

						<div class="clear"></div>

						<ul id="submitField">
							<li class="button">
								<input type="submit" name="_action_save_category" class="save" value="Gravar" />
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
