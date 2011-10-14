
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

function makeBudgetBars(){
	$('#orcm-Basic').find('#orcm-item').each(function(){
		var pgressBar = $(this).find("#progressbar");
		var prevVal = $(this).find("input[name='prevVal']");
		var realVal = $(this).find("input[name='realVal']");
		var percent = (realVal.val() / prevVal.val())*100

		var pGress = setInterval(function() {
			var pVal = pgressBar.progressbar('option', 'value');
			var pCnt = !isNaN(pVal) ? (pVal + 2) : 0; 
			if (pCnt > percent) {
				clearInterval(pGress); 
			} else {
				pgressBar.progressbar({value: pCnt});
			}
		},percent);
	});
}