<%@page import="com.cashbuilder.Constants"%>
<g:javascript>
$('#bt_close_modal').click(function(){
	$('.overlay, .modal').hide();
});
</g:javascript>

<div class="box modal adm-modal">
	<h3 class="title-box">
		<g:message code="form.edituser.data.title"/>
		<a id="bt_close_modal" class='bt-icon text-center'></a>
	</h3>

	<div class="content">
		<g:form name="editUser" action="update" controller="user" >
			<label><g:message code="form.signup.label.firstName" />
			</label><g:textField name="firstName" value="${user?.firstName}"/>
			<label><g:message code="form.signup.label.lastName" />
			</label><g:textField name="lastName" value="${user?.lastName}"/>
			<label><g:message code="form.signup.label.state"/>
			</label><g:select name="state"  from="${Constants.STATES_LIST}" value="${user?.profile?.state}"
								noSelection="[' ': 'Selecione']" valueMessagePrefix="state"/>
			<label><g:message code="form.signup.label.city"/>
			</label><input type="text" name="city" id="city" value="${user?.profile?.city}" />
			<div class="content-center">
				<input type="submit" class="btn" id="submit" value="Gravar"/>
			</div>
		</g:form>
	</div>
</div>

<r:layoutResources disposition="defer"/>