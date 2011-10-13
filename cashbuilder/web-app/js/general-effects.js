
function monthMenuUI(month, menu_id){
	
	var menu = $('#'+menu_id);
	menu.find('li').each(function(i){

		if(i == month){
			$(this).addClass('month_menu_selected');
		} else {
			$(this).hover(
				function () {
					$(this).addClass('month_menu_selected');
				},
				function () {
					$(this).removeClass('month_menu_selected');
				}
			);
		}
	});
}

function cashflow(id){
	
	var table = '#'+id;
	
	$(table+' tr').each(function(){
		
	});

	$(table+' tr').hover(function(){
			var trClassName = $(this).attr('class');
			
			if(trClassName != "header"){
				$(this).addClass("ui-state-hover");
			}
		},function(){
			$(this).removeClass("ui-state-hover");
		}
	);
}