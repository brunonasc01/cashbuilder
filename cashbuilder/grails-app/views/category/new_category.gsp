<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta name="layout" content="base" />
        <r:require module="adm"/>
    </head>
    
    <body>    	
    	<g:render template="/elements/area_title" model="[bundle_key: 'manager.category.title.label']"/>

		<g:render template="/elements/message" var="bean" bean="${category}" ></g:render>

    	<div class="col-50">
		  	<div class="box">
		  		<h3 class="title-box"><g:message code="manager.category.add.label"/></h3>
		  	
				<div class="content">
					<g:form name="new-category" controller="category" >

						<g:hiddenField name="custom" value="${category?.custom }" />

						<h4><g:message code="manager.category.label"/></h4>

						<p>
							<label><g:message code="default.name.label"/>
							</label><g:textField name="name" value="${category?.name }" />
						</p>						

						<label><g:message code="manager.category.income.label"/>
						</label><g:checkBox name="income" value="${category?.income }" />
						<small id="parcel_msg"><g:message code="manager.category.income.warning.message"/></small>

						<hr />						
						
						<h4>
							<g:message code="manager.category.subcategory.label"/>
							<input type="submit" name="_action_add_subcategory" class="btn btn-small" value="Adicionar" />
							<input type="submit" name="_action_remove_subcategory" class="btn btn-small" value="Remover Selecionadas" />
						</h4>
					
						<g:if test="${category?.subcategories}" >
							<g:each var="subcategory" in="${category.subcategories}" status="i">
								<p>
									<g:if test="${ i > 0 }">
										<g:checkBox name="remove_${i}"/>
									</g:if>

									<label>[${i+1}] <g:message code="default.name.label"/>
									</label><g:textField name="subcategories[${i}].name" value="${subcategory.name }"></g:textField>
								</p>
							</g:each>
						</g:if>						

						<div class="content-center">
							<input type="submit" name="_action_save_category" class="btn" value="Gravar" />
						</div>
					</g:form>
            	</div>
		  	</div>
	  	</div>
	  	
	  	<div class="col-50">
	  		<div class="box">
				
				<h3 class="title-box">Editar Categorias</h3>

				<div id="edit-category-list">
					<ul class="inline">
						<li>
							<form>
								<a id="bt_edit_category" href="#" class="bt-icon icon-edit"></a>
								<a id="bt_remove_category" href="#" class="bt-icon icon-delete"></a>
							</form>
						</li><li>
							Receitas
						</li>
					</ul>

					<ul class="inline">
						<li>
							<form>
								<a id="bt_edit_transaction" href="#" class="bt-icon icon-edit"></a>
								<a href="#" class="bt-icon icon-delete"></a>
							</form>
						</li><li>
							Alimentacao
						</li>
					</ul>

					<ul class="inline">
						<li>
							<form>
								<a id="bt_edit_transaction" href="#" class="bt-icon icon-edit"></a>
								<a href="#" class="bt-icon icon-delete"></a>
							</form>
						</li><li>
							Gastos Pessoais
						</li>
					</ul>

					<ul class="inline">
						<li>
							<form>
								<a id="bt_edit_transaction" href="#" class="bt-icon icon-edit"></a>
								<a href="#" class="bt-icon icon-delete"></a>
							</form>
						</li><li>
							Alimentacao
						</li>
					</ul>
				</div>
			</div>
		</div>
	</body>		
</html>
