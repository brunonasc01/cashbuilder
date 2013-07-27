<g:javascript>
$('#bt_close_modal').click(function(){
	$('.overlay, .modal').hide();
});
</g:javascript>

<div class="box modal adm-modal">
	<h3 class="title-box">
		<g:message code="form.contact.popup.title"/>
		<a id="bt_close_modal" class='bt-icon text-center'></a>
	</h3>
	
	<div class="content">
		<p><g:message code="form.contact.message"/></p>
 		
		<hr />
 		
		<g:form name="contact" action="submitContactPopup" >
    		<label for="subject"><g:message code="form.contact.subject.label" />
    		</label><g:select name="subject" from="${subjects}" optionKey="id" optionValue="value"
						noSelection="['': 'Selecione']" value="${contact?.subject }"/>

			<label for="messagem"><g:message code="form.contact.message.label" />
    		</label><g:textArea name="message" cols="50" rows="5" maxlength="750" value="${contact.message }"></g:textArea>
			
			<div class="content-center">
				<input type="submit" class="btn" id="submit" value="Enviar"/>
			</div>
		</g:form>
	</div>
</div>		  	

<r:layoutResources disposition="defer"/>