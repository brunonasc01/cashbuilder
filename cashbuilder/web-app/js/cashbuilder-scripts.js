
/**
 * Atualiza dinamicamente o combo de subcategoria conforme a selecao da categoria 
 * @param action
 * @param category_combo_id
 * @param subcategory_combo_id
 */
function ajaxSubcategoryCombo(action, category_combo_id, subcategory_combo_id){
	
	$("#"+category_combo_id).change(function() {
		$.ajax({
			type: 'post',
			url: action,
			data: "id=" + this.value,
			cache: false,
			success: function(html) {
				$("#"+subcategory_combo_id).html(html);
			}
		});
	});
}

function ajaxSubmitToModal(form,target){

	var form = $('form[name='+form+']');

	form.submit(function(e){
		e.preventDefault();

		var formData = $(this).serialize();
		var formAction = $(this).attr('action');
		var returnElement = $("#"+target);

		
		
		$.ajax({
			  type: "POST",
			  url: formAction,
			  data: formData,
			  cache: false
		}).done(function( html ) {
			returnElement.html(html);
			$('.overlay, .modal').show();
		});
	});
}