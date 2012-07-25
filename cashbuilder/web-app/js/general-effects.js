
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
				budgetSliderBar(this);
				toggleEdit(this);
			});
		});

		animateProgressBar(father);
	});
}

function toggleEdit(element){

	var btedit = $(element).find('.edit');
	var btsave = $(element).find('.save');
	
	$(element).hover(function(){
		
		if(!btsave.is(':visible')){
			btedit.show();
		}
	},function(){
		btedit.hide();
	});
	
	btedit.click(function(){
		$(element).find('#basic').hide();
		$(element).find('#edition').show();
		
		btedit.hide();
		btsave.show();
	});
}

function toggleExpandButton(element){

	var span = element.find('span:first');
	var spanClass = span.attr('class');
	
	if(spanClass.indexOf('plus') != -1){
		span.removeClass('ui-icon-circle-plus');
		span.addClass('ui-icon-circle-minus');
		
	} else if(spanClass.indexOf('minus') != -1){
		span.removeClass('ui-icon-circle-minus');
		span.addClass('ui-icon-circle-plus');
	}
}

function staticProgressBar(element){
	var pgressBar = $(element).find("#progressbar");
	var prevVal = $(element).find("input[name='prevVal']");
	var realVal = $(element).find("input[name='realVal']");
	var percent = (realVal.val() / prevVal.val())*100

	pgressBar.progressbar({value: percent});
}

function budgetSliderBar(element){
	var sliderBar = $(element).find("#sliderbar");
	var prevVal = $(element).find("input[name='prevVal']");
	var realVal = $(element).find("input[name='realVal']");
	var displayVal = $(element).find("#prev");
	var manualInput = $(element).find("input[name='manualValue']");
	var formInputValue = $(element).find("input[name='budgetedValue']");

	sliderBar.slider({
		range: "min",
		value: prevVal.val(),
		min: 0,
		max: (realVal.val() > prevVal.val()) ? parseInt(realVal.val()) : prevVal.val()*3 ,
		step: 10,
		slide: function( event, ui ) {
			
			var value = new String(ui.value);
			value = normalizeDecimal(value);
			
			manualInput.val( value );
			formInputValue.val( value );
			displayVal.html( "R$ " + value );
		}
	});
	
	manualInput.focusout(function(){
		
		var value = $(this).val().replace(',','.');
		var normValue = normalizeDecimal($(this).val());
		
		sliderBar.slider('option', 'value', value);
		displayVal.html( "R$ " + normValue );
		formInputValue.val( normValue );
	});
	
	var undoButton = $(element).find("button[name='undo']");
	
	undoButton.click(function(e){
		e.preventDefault();
		var normValue = normalizeDecimal(prevVal.val());
				
		manualInput.val( normValue );
		displayVal.html( "R$ " + normValue );
		
		$(element).find('#edition').hide();
		$(element).find('#basic').show();
		
		$(element).find('.save').hide();
		$(element).find('.edit').show();
	});
}

function normalizeDecimal(value){
	
	if(value.indexOf('.') != -1){
		return value.replace('.',',');
	} else {
		return value;
	}
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

function styleButtons(){
	$(function() {
		$( "input:submit, button, input:reset" ).button();
	});
}