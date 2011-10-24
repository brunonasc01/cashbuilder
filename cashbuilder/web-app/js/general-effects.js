
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
	$('.basic').find('#orcm-Basic').each(function(){
		
		var item = $(this).find('#orcm-item');
		var subitem = $(this).find('#orcm-subitem');
		var btplus = item.find('span:first');

		btplus.click(function(){
			toggleExpandButton(btplus);
			subitem.parents('#list-detail').slideToggle('fast');

			subitem.each(function(){
				activateProgressBar(this);
			});
		});

		activateProgressBar(item);
	});
}

function toggleExpandButton(element){
	
	(element.html() == "+") ?
			element.html("-") : element.html("+");
}

function activateProgressBar(element){
	var pgressBar = $(element).find("#progressbar");
	var prevVal = $(element).find("input[name='prevVal']");
	var realVal = $(element).find("input[name='realVal']");
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
}