/** Inicializacao do menu mobile */
$(function() {  
	
	var windowWidth = $(window).width();  
	
	if(windowWidth <= 500){	
	    var pull        = $('#mobile-menu');  
	        menu        = $('#main-menu .items');  
	        menuHeight  = menu.height();  
	  
	    $(pull).on('click', function(e) {  
	        e.preventDefault();  
	        menu.slideToggle();  
	    });  
	    
	    $('.mobile-only').show();
	}
});


/**
 * Atualiza dinamicamente o combo de subcategoria conforme a selecao da categoria 
 * @param action
 * @param category_combo_id
 * @param subcategory_combo_id
 */
function ajaxSubcategoryCombo(action, category_combo_id, subcategory_combo_id, multiple_subs, subcategory_combo_name){
	
	$("#"+category_combo_id).change(function() {
		$.ajax({
			type: 'post',
			url: action,
			data: "id=" + this.value + "&name=" + subcategory_combo_name,
			cache: false,
			success: function(html) {
				if(multiple_subs == "true"){
					$("span[id*='"+subcategory_combo_id+"']").each(function(i){
						var re = new RegExp('[X]', 'g');
						var select = html.replace(re,i);

						$(this).html(select)
					})
				} else {
				$("#"+subcategory_combo_id).html(html);
			}
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

		if(action != null){
			formAction = action
		}

		ajaxModalProcess("POST", formAction, formData, target);
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
		var href = link.attr('href');

		ajaxModalProcess("GET", href, null, target);
	});
}


/**
 * Processa uma chamada modal
 * @param _type tipo GET/POST
 * @param _url caminho da action
 * @param _data dados serializados (de formularios)
 * @param _target id do elemento que deve receber o retorno
 */
function ajaxModalProcess(_type, _url, _data, _target){
	
	var returnElement = $("#"+_target);
	
	//chama a versao modal do formulario
	_url = _url.replace('create','create_modal')
	_url = _url.replace('edit','edit_modal')
	_url = _url.replace('delete','delete_modal')
	
	$.ajax({
		  type: _type,
		  url: _url,
		  data: _data,
		  cache: false
	}).done(function( html ) {
		returnElement.html(html);
		setModalPosition(_target);

		$( window ).resize(function() {
			setModalPosition(_target);
		});

		$('.overlay, .modal').show();
	});
}

/**
 * Define dinamicamente a posicao do modal
 * @param target id do elemento modal
 */
function setModalPosition(target){
	
	var windowWidth = $(window).width();
	var windowHeight = $(window).height();
	
	var modal = $("#"+target).children(".modal");
	var modalWidth = modal.width()
	var modalHeight = modal.height()

	if(windowWidth > modalWidth && windowHeight > modalHeight) {
		var hCenter = parseInt(modalWidth/2)
		var vCenter = parseInt(modalHeight/2)
		modal.css("margin-left","-"+hCenter+"px");
		modal.css("margin-top","-"+vCenter+"px");
	}
}

/**
 * Destaca o mes atual no menu
 * @param month
 * @param menu_id
 */
function setMonthSelection(month, menu_id, currentMonth){

	$('#'+menu_id+' a').each(function(i){
		if(i == month){
			$(this).addClass('active');
		} else if(i < currentMonth) {
			$(this).addClass('past');
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
 * Verifica se o tamanho da tela corresponde a 
 * de um celular
 * @returns {Boolean}
 */
function isMobileScr(){
	var windowWidth = $(window).width();  
	
	if(windowWidth <= 500){
		return true		
	}
	
	return false
}


/**
 * Inicializa os Scripts da area Orcamento
 */
function initBudgetScripts(){
	$(function() {
		
		if(isMobileScr() == false){
			ajaxSubmitToModal('editBudgetForm','modal');
		}
	
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
		
		if(isMobileScr() == false){
			ajaxSubmitToModal('newTransactionForm','modal');
			ajaxSubmitToModal('editTransactionForm','modal');
		}
	
		$('.icon-edit').click(function(){
			$(this).parents('form:first').submit();
		});
		
		$('.icon-delete').click(function(){
				$(this).parents('form:first').submit();
		});
		
		$('#unDeleteLink').click(function(e){
			e.preventDefault();
			$(this).parents('form:first').submit();
		});

		enableCloseOverlay();
	});
}

/**
 * Inicializa os Scripts da area Metas
 */
function initGoalScripts(){
	$(function() {
		
		if(isMobileScr() == false){
			ajaxSubmitToModal('createGoalForm','modal');		
			enableCloseOverlay();
		}
		
		$('.icon-delete').click(function(){
				$(this).parents('form:first').submit();
		});

		$('#unDeleteLink').click(function(e){
			e.preventDefault();
			$(this).parents('form:first').submit();
		});
	});
}

/**
 * Inicializa os Scripts da area Administracao
 */
function initAdminScripts(){
	$(function() {
		if(isMobileScr() == false){
			ajaxLinkToModal('edit_user_link','modal')
	    	ajaxLinkToModal('edit_mail_link','modal')
	    	ajaxLinkToModal('edit_password_link','modal')
	    	
	    	enableCloseOverlay();
		}
	});
}

/**
 * Inicializa os Scripts da area Administracao
 */
function initCategoryAdminScripts(){
	$(function() {
		$('.icon-edit').click(function(){
			$(this).parents('form:first').submit();
		});
		
		$('.icon-delete').click(function(){
			$(this).parents('form:first').submit();
		});
		
		if(isMobileScr() == false){
			ajaxSubmitToModal('editCategoryForm','modal')
			ajaxSubmitToModal('deleteCategoryForm','modal')			
	    	enableCloseOverlay();
		}
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