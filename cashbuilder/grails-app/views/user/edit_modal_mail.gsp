<g:javascript>
$('#bt_close_modal').click(function(){
	$('.overlay, .modal').hide();
});
</g:javascript>

<div class="box modal adm-modal">
	<h3 class="title-box">
		<g:message code="manager.user.update.mail.label"/>
		<a id="bt_close_modal" class='bt-icon text-center'></a>
	</h3>
	
	<div class="content">
		<g:form name="editMail" action="updateMail" controller="user" >
			<label><g:message code="edit.email.label" />
			</label><g:textField name="email" value=""/>
			
			<hr/>
			
			<label><g:message code="emailNew.label" />
			</label><g:textField name="emailNew" value=""/>
			
			<label><g:message code="emailRepeat.label" />
			</label><g:textField name="emailRepeat" value=""/>
			
			<div class="content-center">
				<input type="submit" class="btn" id="submit" value="Gravar"/>
			</div>
		</g:form>
	</div>
</div>

<r:layoutResources disposition="defer"/>