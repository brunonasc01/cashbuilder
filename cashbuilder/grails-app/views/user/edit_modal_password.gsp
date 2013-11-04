<g:javascript>
$('#bt_close_modal').click(function(){
	$('.overlay, .modal').hide();
});
</g:javascript>

<div class="box modal adm-modal">
	<h3 class="title-box">
		<g:message code="manager.user.update.password.label"/>
		<a id="bt_close_modal" class='bt-icon text-center'></a>
	</h3>

	<div class="content">
		<g:form name="editPassword" action="updatePassword" controller="user" >
			<label><g:message code="edit.password.label" />
			</label><g:passwordField name="password" value=""/>
			
			<hr />
			
			<label><g:message code="passwordNew.label" />
			</label><g:passwordField name="passwordNew" value=""/>
			
			<label><g:message code="passwordRepeat.label" />
			</label><g:passwordField name="passwordRepeat" value=""/>
			
			<div class="content-center">
				<input type="submit" class="btn" id="submit" value="Gravar"/>
			</div>
		</g:form>
	</div>
</div>

<r:layoutResources disposition="defer"/>