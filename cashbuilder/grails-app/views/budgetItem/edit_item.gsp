<g:javascript>
$('#bt_close_modal').click(function(){
	$('.overlay, .modal').hide();
});
</g:javascript>

<div class="box modal budget-modal">
	<h3 class="title-box">
		Alterar Orçamento
		<a id="bt_close_modal" class='bt-icon text-center'></a></h3>
	<div class="content">
		<h4>${bean.subcategory?.name }</h4>

		<g:form action="update" controller="budgetItem">
			<g:hiddenField name="id" value="${bean.id}"/>
			<g:hiddenField name="monthId" value="${monthId}"/>
		
			<label>Valor Atual</label>
			<g:textField maxlength="10" name="oldValue" value="${bean.budgetedValue}" disabled="true"/>

			<label>Novo Valor</label>
			<g:textField maxlength="10" name="budgetedValue" value="" />

			<div class="content-center">
				<input type="submit" class="btn" id="submit" value="Gravar"/>
			</div>
		</g:form>
	</div>
</div>

<r:layoutResources disposition="defer"/>