
function ajaxComboSubcategoria(idCategoria,action,idComboSubcategoria){
	
	$("#"+idCategoria).change(function() {
		$.ajax({
			type: 'post',
			url: action,
			data: "id=" + this.value,
			cache: false,
			success: function(html) {
				$("#"+idComboSubcategoria).html(html);
			}
		});
	});
}

function ajaxModal(idTrigger,action,idResult){
	
	$("#"+idTrigger).click(function(e) {
		e.preventDefault();
		
		$.ajax({
			type: 'post',
			url: action,
			cache: false,
			success: function(html) {
				$("#"+idResult).html(html);
				autoModal(idResult);
			}
		});
	});
}

function ajaxSubmitToModal(trigger,action,result){

	$('input[name="edit"]').click(function(e){
		e.preventDefault();

		$.ajax({
			type: 'POST',
			data: $(this).parents('form:first').serialize(),
			url: action,
			success:function(data,textStatus){
				$("#"+result).html(data);
				autoModal(result);
			},
			error:function(XMLHttpRequest,textStatus,errorThrown){},
			complete:function(XMLHttpRequest,textStatus){}
		});
	});
}

function autoModal(id) {

	var result = "#"+id;
	
	var maskHeight = $(document).height();
	var maskWidth = $(window).width();

	$('.mascara').css({
		'width' : maskWidth,
		'height' : maskHeight
	});

	$('.mascara').fadeTo("fast", 0.4);

	var winH = $(window).height();
	var winW = $(window).width();

	$(result).css('top', winH / 2 - $(result).height() / 2);
	$(result).css('left', winW / 2 - $(result).width() / 2);

	$(result).fadeIn(1000);

	$('.mascara').click(function() {
		$(this).hide();
		$(result).hide();
	});
}

function modal(trigger,id) {	

	$("#"+trigger).click(function(e) {
		e.preventDefault();
		
		//var id = $(this).attr('href');
	
		var maskHeight = $(document).height();
		var maskWidth = $(window).width();
	
		$('.mascara').css({'width':maskWidth,'height':maskHeight});

//		$('.mascara').fadeIn(1000);	
//		$('.mascara').fadeTo("slow",0.8);	
		$('.mascara').fadeTo("fast",0.8);
		
	
		//Get the window height and width
		var winH = $(window).height();
		var winW = $(window).width();
              
		$("#"+id).css('top',  winH/2-$("#"+id).height()/2);
		$("#"+id).css('left', winW/2-$("#"+id).width()/2);
	
		$("#"+id).fadeIn(1000); 
	
	});
	
//	$('.window .close').click(function (e) {
//		e.preventDefault();
//		
//		$('#mask').hide();
//		$('.window').hide();
//	});		
	
	$('.mascara').click(function () {
		$(this).hide();
		$("#"+id).hide();
	});			
}

function ajaxValidate(action,formId,short){
	
	var form = $('#'+formId);
			
	form.find('input[type="submit"]').click(function(e){
		
		e.preventDefault();
		var parameters = '&fieldName=FORM';
		
		$.ajax({
			type: 'post',
			url: action,
			data: form.serialize()+parameters,
			cache: false,
			success: function(html) {
				if(html.length > 0){
					renderSubmitErrors(html,formId);
					return false
				} else {
					form.submit();
				}
			}
		});
	});

	form.find('#field').each(function(i){
		
		$(this).find('input:first,select:first').focusout(function(){

			var name = $(this).attr('name')
			var parameters = processParameters(name,form);
			
			$.ajax({
				type: 'post',
				url: action,
				data: $(this).serialize()+parameters,
				cache: false,
				success: function(html) {
					if(!short){
						renderErrors(html,i,formId)
					} else {
						renderShortErrors(html,i,formId)
					}
				}
			});
		});
	});
}

function processParameters(name,form){

	var params = '&fieldName='+name;
	
	if(name.indexOf('Repeat') != -1){
		var ancName = name.substring(0,name.indexOf('Repeat'));
		var ancField = form.find('input[name='+ancName+']');
		
		params += '&';
		params += ancField.serialize();
	} else if(name.indexOf('data') != -1 || name == name.indexOf('date') != -1){
				
		var dayField = form.find('input[name="'+name+'_day"]');
		params += serializeField(dayField)
		
		var monthField = form.find('input[name="'+name+'_month"]');
		params += serializeField(monthField)
		
		var yearField = form.find('input[name="'+name+'_year"]');
		params += serializeField(yearField)
	}

	return params;
}

function serializeField(field){
	
	return '&'+field.serialize();
}

function renderSubmitErrors(data,formId){

	var submitField = $('#'+formId).find('#submitField div:last');
	
	if(data.length > 0){
		submitField.html(data);
		submitField.show();
	}else{
		submitField.hide();
	}
}

function renderErrors(data,index,formId){

	var formField = $('#'+formId).find('#field').eq(index);
	
	if(data.length > 0){
		formField.find('div:last').removeClass('ok-msg');
		
		formField.find('label:first').addClass('error-label');
		formField.find('input:first').addClass('error-input');
		formField.find('div:last').addClass('error-msg');
		formField.find('div:last').html(data);
	} else {
		formField.find('label:first').removeClass('error-label');
		formField.find('input:first').removeClass('error-input');
		formField.find('div:last').removeClass('error-msg');
		
		formField.find('div:last').html('OK');
		formField.find('div:last').addClass('ok-msg');
	}
}

function renderShortErrors(data,index,formId){

	var formField = $('#'+formId).find('#field').eq(index);
	
	if(data.length > 0){
		formField.find('div:odd').removeClass('form-input-ok');
		
		formField.find('label:first').addClass('error-label');
		formField.find('input:first,select:first').addClass('error-input');
		formField.find('div:odd').addClass('form-input-error');
		formField.find('div:last').addClass('error-msg-short');		
		formField.find('div:last').html(data);
		formField.find('div:last').slideDown('slow');
	} else {
		formField.find('label:first').removeClass('error-label');
		formField.find('input:first,select:first').removeClass('error-input');
		formField.find('div:odd').removeClass('form-input-error');
		formField.find('div:last').slideUp('slow');
		formField.find('div:last').html('');
		formField.find('div:odd').addClass('form-input-ok');
	}
}
