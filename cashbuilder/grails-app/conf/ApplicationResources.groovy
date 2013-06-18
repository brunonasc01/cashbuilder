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
	
	budget {
		dependsOn 'core'
		resource url:'css/cashbuilder-budget.css'
	}
	
	cashflow {
		dependsOn 'core'
		resource url:'css/cashbuilder-cashflow.css'
	}
	
	reports {
		dependsOn 'core'
		resource url:'css/charts/charts-core.css'
	}
	
	goal {
		dependsOn 'core'
		resource url:'css/cashbuilder-goal.css'
	}
	
	adm {
		dependsOn 'core'
		
	}
	
	help {
		dependsOn 'core'
		resource url:'css/cashbuilder-help.css'
	}
	
	recaptcha {
		resource url:'css/recaptcha.css'
	}
	
	portal {
		dependsOn 'core'
		resource url:'css/cashbuilder-portal.css'
	}
}