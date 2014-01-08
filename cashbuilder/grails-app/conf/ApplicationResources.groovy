modules = {
	core {
		dependsOn 'jquery'
		
		resource url:'css/normalize.css'

		resource url:'css/grid/responsive_grid.css'
		
		resource url:'css/cashbuilder-reset.css'
		resource url:'css/cashbuilder-utils.css'
		resource url:'css/cashbuilder-core.css'
		resource url:'css/cashbuilder-forms.css'
		resource url:'css/cashbuilder-responsive.css'
		
		resource url:'js/cashbuilder-scripts.js'
	}
	
	datepicker {
		resource url:'css/jquery-ui/jquery-ui-1.10.3.min.css'
		resource url:'css/cashbuilder-datepicker.css'

		resource url:'js/jquery-ui-1.10.3.min.js'
		resource url:'js/locale/jquery.ui.datepicker-pt-BR.js'
	}
	
	home {
		dependsOn 'core,datepicker'
		
		resource url:'css/cashbuilder-home.css'
	}
	
	budget {
		dependsOn 'core'
		resource url:'css/cashbuilder-budget.css'
	}
	
	cashflow {
		dependsOn 'core,datepicker'
		resource url:'css/cashbuilder-cashflow.css'
	}
	
	reports {
		dependsOn 'core'
		resource url:'css/charts/charts-core.css'
	}
	
	goal {
		dependsOn 'core,datepicker'
		resource url:'css/cashbuilder-goal.css'
	}
	
	adm {
		dependsOn 'core'
		resource url:'css/cashbuilder-adm.css'
	}
	
	help {
		dependsOn 'core'
		resource url:'css/cashbuilder-help.css'
	}
	
	portal {
		dependsOn 'core'
		resource url:'css/cashbuilder-portal.css'
		resource url:'js/picturefill.js'
	}
}