
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

/**
 * Submete o formulario e renderiza o retorno num modal
 * @param form nome do formulario
 * @param target local onde deve ser renderizado o retorno
 * @param action action que deve ser executada
 */
function ajaxSubmitToModal(form,target,action){

	var form = $('form[name='+form+']');

	form.submit(function(e){
		e.preventDefault();

		var formData = $(this).serialize();
		var formAction = $(this).attr('action');
		var returnElement = $("#"+target);

		if(action != null){
			formAction = action
		}
		
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

/**
 * Renderiza o destino do link num modal
 * @param trigger id do link
 * @param target local onde deve ser renderizado o destino do link
 */
function ajaxLinkToModal(trigger,target){
	
	var link = $("#"+trigger);
	
	link.click(function(e) {
		e.preventDefault();
		
		var returnElement = $("#"+target);
		var href = link.attr('href');

		$.ajax({
			  type: "GET",
			  url: href,
			  data: null,
			  cache: false
		}).done(function( html ) {
			returnElement.html(html);
			$('.overlay, .modal').show();
		});
	});
}

/**
 * Destaca o mes atual no menu
 * @param month
 * @param menu_id
 */
function setMonthSelection(month, menu_id){
	
	var menu = $('#'+menu_id);
	menu.find('a').each(function(i){
		
		if(i == month){
			$(this).addClass('active');
		} else {
			$(this).hover(
				function () {
					$(this).addClass('active');
				},
				function () {
					$(this).removeClass('active');
				}
			);
		}
	});
}

/**
 * Fecha o modal e a sombra
 */
function enableCloseOverlay(){
	$('.overlay').click(function(){
		$('.overlay, .modal').hide();
	});
}

/**
 * Inicializa os Scripts da area Orcamento
 */
function initBudgetScripts(){
	$(function() {
		ajaxSubmitToModal('editBudgetForm','modal');
	
		$('.icon-edit').click(function(){
			$(this).parents('form:first').submit();
		});
		
		$('.bt_expand').click(function(){
		
			var childList = $(this).parents('ul:first').next('.subcategory-list');
			var _height = childList.css('height');

			if(_height == '0px'){
				$(this).toggleClass('icon-plus');
				$(this).toggleClass('icon-minus');

				childList.css('height','auto')
				var height = childList.height()
				childList.css('height',height+'px')
			} else {
				$(this).toggleClass('icon-minus');
				$(this).toggleClass('icon-plus');

				childList.css('height','0px')
			}
		});

		enableCloseOverlay();
	});
}

/**
 * Inicializa os Scripts da area Orcamento
 */
function initCashflowScripts(){
	$(function() {
		ajaxSubmitToModal('newTransactionForm','modal');
		ajaxSubmitToModal('editTransactionForm','modal');
	
		$('.icon-edit').click(function(){
			$(this).parents('form:first').submit();
		});
		
		$('.icon-delete').click(function(){
			if(confirm('Tem Certeza ?')){
				$(this).parents('form:first').submit();
			}			
		});

		enableCloseOverlay();
	});
}

/**
 * Inicializa os Scripts da area Metas
 */
function initGoalScripts(){
	$(function() {
		ajaxSubmitToModal('createGoalForm','modal');
		
		enableCloseOverlay();
	});
}

/**
 * Inicializa os Scripts da area Administracao
 */
function initAdminScripts(){
	$(function() {
		ajaxLinkToModal('edit_user_link','modal')
    	ajaxLinkToModal('edit_mail_link','modal')
    	ajaxLinkToModal('edit_password_link','modal')
    	
    	enableCloseOverlay();
	});
}

function processAnswers(regionId){
	$('#'+regionId+' li p').css('height','0px');
	
	var span = $('#'+regionId+' li span');
	span.css('cursor','pointer');

	span.click(function(){
		$(this).parent().siblings().children('p').css('height','0px');

		var answer = $(this).next();

		answer.css('height','auto');
		var height = answer.height()
		answer.css('height',height+'px')
	});
}