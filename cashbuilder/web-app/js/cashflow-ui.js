
function cashflow(id){
				
	var table = '#'+id;
	
	$(table+' tr').each(function(){
		
	});

	$(table+' tr').hover(function(){
		$(this).addClass("ui-state-hover");
		},function(){
			$(this).removeClass("ui-state-hover");
		}
	);
}