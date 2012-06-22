<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <meta name="layout" content="base" />
        <r:require module="adm"/>
    </head>
    
    <body>
    	<div class="span-24">
			<div id="title">
    			<h3>Edicao de Categorias</h3>
    		</div>
    	</div>
    
    	<div class="span-20 prepend-2 append-2">
		  	<div id="obox">
				<g:form class="newUser" name="new_category" controller="category" >
					<div class="title">
						Nova Categoria
					</div>

					<div class="inside">
						<g:if test="${flash.message}">
							<div class="form-errors">
								<ul>
									<li><g:message code="${flash.message}"/></li>
								</ul>
							</div>
						</g:if>
				  		<g:else>					
							<g:hasErrors bean="${category}">
				            	<div class="form-errors">
				                	<g:renderErrors bean="${category}" as="list" />
				            	</div>
				            </g:hasErrors>
			            </g:else>
			            
			            <div class="clear"></div>

						<small><g:message code="form.compulsory.message" /></small>
					
						<g:hiddenField name="custom" value="${category?.custom }" />

						<h3>Categoria</h3>

						<ul id="field">
							<li class="label">
								<g:message code="category.nome.label" default="Nome" />*
							</li>
							<li class="input field-space">
								<g:textField name="name" value="${category?.name }" />
							</li>
						</ul>

						<hr />

						<ul id="field">
							<li class="label">
								<g:message code="categoria.receita.label" default="Receita" />
							</li>
							<li class="input">
								<g:checkBox name="income" value="${category?.income }" />
								<small id="parcel_msg">marque para categorias do tipo Entrada</small>
							</li>
						</ul>
	
						<hr />
						
						<h3>Subcategorias <input type="submit" name="_action_add_subcategory" class="add_button" value="Adicionar" /></h3>
						
						<g:if test="${category?.subcategories}" >
							<g:each var="subcategory" in="${category.subcategories.sort{it.name}}" status="i">
								<ul id="field">
									<li class="label">
										<g:message code="subcategoria.nome.label" default="Nome" />*
									</li>
									<li class="input">
										<g:textField name="subcategories[${i}].name" value="${subcategory.name }"></g:textField>
									</li>
								</ul>
								<hr />
							</g:each>
						</g:if>

						<p class="policy-message"></p>

						<ul id="submitField">
							<li class="button">
								<input type="submit" name="_action_save_category" class="save" value="Gravar" />
							</li>
						</ul>
	
						<div class="clear"></div>
	            	</div>
	            </g:form>
		  	</div>
	  	</div>
	  	<div class="clear"></div>
	</body>		
</html>
