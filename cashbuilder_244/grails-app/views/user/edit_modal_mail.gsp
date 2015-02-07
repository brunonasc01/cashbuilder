<g:javascript>
$('#bt_close_modal').click(function(){
	$('.overlay, .modal').hide();
});
</g:javascript>

<div class="box modal adm-modal">
	<h3 class="title-box">
		<g:message code="form.edituser.mail.title"/>
		<a id="bt_close_modal" class='bt-icon text-center'></a>
	</h3>
	
	<div class="content">
		<g:form name="editMail" action="updateMail" controller="user" >
			<label><g:message code="form.edituser.label.email" />
			</label><g:textField name="email" value=""/>
			<hr/>

			<label><g:message code="form.edituser.label.emailNew" />
			</label><g:textField name="emailNew" value=""/>
			<label><g:message code="form.edituser.label.emailRepeat" />
			</label><g:textField name="emailRepeat" value=""/>

			<div class="content-center">
				<input type="submit" class="btn" id="submit" value="Gravar"/>
			</div>
		</g:form>
	</div>
</div>

<r:layoutResources disposition="defer"/>