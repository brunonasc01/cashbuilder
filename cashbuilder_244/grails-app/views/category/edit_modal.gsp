<g:javascript>
$('#bt_close_modal').click(function(){
	$('.overlay, .modal').hide();
});
</g:javascript>

<div class="box modal adm-modal">
	<h3 class="title-box">
		<g:message code="form.manager.category.edit.title"/>
		<a id="bt_close_modal" class='bt-icon text-center'></a>
	</h3>

	<div class="content">
		<h4>${category.name }</h4>
	
		<g:form name="editCategory" action="update" controller="category" >
			<g:hiddenField name="id" value="${category.id }"/>
			
			<g:each var="subcategory" in="${category.subcategories}" status="i">
				<label>[${i+1}] <g:message code="form.label.name"/>
				</label><g:textField name="subcategories[${i}].name" value="${subcategory.name}" />

			</g:each>

			<div class="content-center">
				<input type="submit" class="btn" id="submit" value="Gravar"/>
			</div>
		</g:form>
	</div>
</div>

<r:layoutResources disposition="defer"/>