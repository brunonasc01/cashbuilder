
function monthMenuUI(month, menu_id){
	
	var menu = $('#'+menu_id);
	menu.find('li').each(function(i){
		
		if(i == month){
			$(this).addClass('selected');
		} else {
			$(this).hover(
				function () {
					$(this).addClass('selected');
				},
				function () {
					$(this).removeClass('selected');
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
	$('#rbox').find('#budgetList').each(function(){
		
		var father = $(this).find('#fatherItem');
		var child = $(this).find('#childItem');
		var expandButton = father.find('li[class=button]');

		child.hide();
		
		expandButton.click(function(){
			toggleExpandButton(expandButton);
			child.slideToggle('fast');

			child.find('#item').each(function(){
				staticProgressBar(this);
			});
		});

		animateProgressBar(father);
	});
}

function toggleExpandButton(element){
	(element.html() == "+") ?
			element.html("-") : element.html("+");
}

function staticProgressBar(element){
	var pgressBar = $(element).find("#progressbar");
	var prevVal = $(element).find("input[name='prevVal']");
	var realVal = $(element).find("input[name='realVal']");
	var percent = (realVal.val() / prevVal.val())*100

	pgressBar.progressbar({value: percent});
}

function animateProgressBar(element){
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

function enableParcels(){
	$(function(){
		$('#hidden_element').show();
		$('#parcels').toggle();
		
		$('#parcel').click(function(){
			$('#parcel_msg').toggle();
			$('#parcels').toggle();
			
			if(!$('#parcels').is(':visible')){
				$('#parcels').attr("value","1");
			}
		});
	});
}

function styleButtons(){
	$(function() {
		$( "input:submit, button, input:reset" ).button();
	});
}