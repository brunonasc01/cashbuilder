
function ajaxComboSubcategoria(idCategoria,action,idComboSubcategoria){
	
	$("#"+idCategoria).change(function() {
		$.ajax({
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
			url: action,
			cache: false,
			success: function(html) {
				$("#"+idResult).html(html);
				autoModal(idResult);
			}
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

	$('.mascara').fadeTo("fast", 0.8);

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
