<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta name="layout" content="base" />
        <r:require module="adm"/>
        
        <g:javascript>
		initCategoryAdminScripts();
		</g:javascript>
    </head>
    
    <body>
    	<g:render template="/elements/area_title" model="[bundle_key: 'form.manager.category.title']"/>

		<g:render template="/elements/message" var="bean" bean="${errorBean}" ></g:render>

    	<div class="col-50">
		  	<div class="box">
		  		<h3 class="title-box"><g:message code="form.manager.category.new.label"/></h3>

				<div class="content">
					<g:form name="new-category" controller="category" >
						<g:hiddenField name="custom" value="${category?.custom }" />
						<h4><g:message code="form.label.category"/></h4>

						<p>
							<label><g:message code="form.label.name"/>
							</label><g:textField name="name" value="${category?.name }" />
						</p>

						<label><g:message code="form.manager.category.label.income"/>
						</label><g:checkBox name="income" value="${category?.income }" />
						<small id="parcel_msg"><g:message code="form.manager.category.warning.income"/></small>
						<hr />

						<h4>
							<g:message code="form.manager.category.label.subcategory"/>
							<input type="submit" name="_action_add_subcategory" class="btn btn-small" value="Adicionar" />
							<input type="submit" name="_action_remove_subcategory" class="btn btn-small" value="Remover Selecionadas" />
						</h4>

						<g:if test="${category?.subcategories}" >
							<g:each var="subcategory" in="${category.subcategories}" status="i">
								<p>
									<g:if test="${ i > 0 }">
										<g:checkBox name="remove_${i}"/>
									</g:if>

									<label>[${i+1}] <g:message code="form.label.name"/>
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
				<h3 class="title-box"><g:message code="form.manager.category.edit.title"/></h3>

				<g:if test="${!editCategories.empty}">
				<div id="edit-category-list">
					<g:each var="cCategory" in="${editCategories }">
					<ul class="inline">
						<li>
							<g:form name="editCategoryForm" action="edit" controller="category">
								<g:hiddenField name="id" value="${cCategory.id }"/>
								<a class="bt-icon icon-edit"></a>
							</g:form>

							<g:form name="deleteCategoryForm" action="delete" controller="category">
								<g:hiddenField name="id" value="${cCategory.id }"/>
								<a class="bt-icon icon-delete"></a>
							</g:form>
						</li><li>
							${cCategory.name }
						</li>
					</ul>
					</g:each>
				</div>
				</g:if>
				<g:else>
					<div class="content">
						<g:message code="form.manager.category.edit.empty"/>
					</div>
				</g:else>
			</div>
		</div>
	</body>		
</html>