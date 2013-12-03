<g:javascript>
$('#bt_close_modal').click(function(){
	$('.overlay, .modal').hide();
});
</g:javascript>

<div class="box modal adm-modal">
	<h3 class="title-box">
		<g:message code="manager.user.update.data.label"/>
		<a id="bt_close_modal" class='bt-icon text-center'></a>
	</h3>

	<div class="content">
		<g:form name="editUser" action="update" controller="user" >
			<label><g:message code="firstName.label" />
			</label><g:textField name="firstName" value="${user?.firstName}"/>
			<label><g:message code="lastName.label" />
			</label><g:textField name="lastName" value="${user?.lastName}"/>
			<label><g:message code="profile.state.label"/>
			</label><input type="text" name="state" id="state" value="${user?.profile?.state}" />
			<label><g:message code="profile.city.label"/>
			</label><input type="text" name="city" id="city" value="${user?.profile?.city}" />

			<div class="content-center">
				<input type="submit" class="btn" id="submit" value="Gravar"/>
			</div>
		</g:form>
	</div>
</div>

<r:layoutResources disposition="defer"/>