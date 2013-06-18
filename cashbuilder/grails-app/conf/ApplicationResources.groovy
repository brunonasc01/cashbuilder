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
	}
	
	cashflow {
		dependsOn 'core'
		
	}
	
	budget {
		dependsOn 'core'
		
	}
	
	goal {
		dependsOn 'core'
		
	}
	
	reports {
		dependsOn 'core'
		
	}
	
	adm {
		dependsOn 'core'
		
	}
	
	recaptcha {
		resource url:'css/recaptcha.css'
	}
	
	portal {
		dependsOn 'core'
		resource url:'css/cashbuilder-portal.css'
	}
}