
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
	$('#'+trigger).click(function(e){
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

function ajaxValidate(action){
	
	$('form:first #field').each(function(i){
		
		$(this).find('input:first').change(function(){

			var name = $(this).attr('name')
			
			var parameters = '&fieldName='+name;
			
			if(name.indexOf('Repeat') != -1){
				
				var ancName = name.substring(0,name.indexOf('Repeat'));
				var ancField = $('form:first').find('input[name='+ancName+']');
				
				parameters += '&';
				parameters += ancField.serialize();
			}
			
			$.ajax({
				type: 'post',
				url: action,
				data: $(this).serialize()+parameters,
				cache: false,
				success: function(html) {
					renderErrors(html,i)
				}
			});
		});
	});
}

function renderErrors(data,index){

	if(data.length > 0){
		$('form:first #field').eq(index).find('div:last').removeClass('ok_msg');
		
		$('form:first #field').eq(index).find('label:first').addClass('error_label');
		$('form:first #field').eq(index).find('input:first').addClass('error_border');
		$('form:first #field').eq(index).find('div:last').addClass('error_msg');
		$('form:first #field').eq(index).find('div:last').html(data);
	} else {
		$('form:first #field').eq(index).find('label:first').removeClass('error_label');
		$('form:first #field').eq(index).find('input:first').removeClass('error_border');
		$('form:first #field').eq(index).find('div:last').removeClass('error_msg');
		
		$('form:first #field').eq(index).find('div:last').html('OK');
		$('form:first #field').eq(index).find('div:last').addClass('ok_msg');
	}
}
