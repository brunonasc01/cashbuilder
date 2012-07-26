modules = {
    application {
        resource url:'js/application.js'
    }
	
	core {
		dependsOn 'jquery'
		
		resource url:'css/blueprint/screen.css', attrs: [media: 'screen, projection']
		resource url:'css/blueprint/print.css', attrs: [media: 'print']
		resource url:'css/blueprint/ie.css', attrs:[media:'screen, projection'], wrapper: { s -> "<!--[if IE]>$s<![endif]-->" }

		resource url:'css/custom-theme/jquery-ui.css'
		resource url:'css/form.css'
		resource url:'css/layout.css'
		
		resource url:'js/locale/jquery.ui.datepicker-pt-BR.js'
		resource url:'js/jquery-ui.js'
		resource url:'js/funcoes-gerais.js'
		resource url:'js/general-effects.js', disposition: 'head'
	}
	
	cashflow {
		dependsOn 'core'
		resource url:'css/cashflow.css'
	}
	
	budget {
		dependsOn 'core'
		resource url:'css/budget.css'
	}
	
	goal {
		dependsOn 'core'
		resource url:'css/goal.css'
//		resource url:'css/modalform.css'
	}
	
	reports {
		dependsOn 'core'
		resource url:'css/reports.css'		
		resource url:'js/FusionCharts.js', disposition: 'head'
	}
	
	adm {
		dependsOn 'core'
		resource url:'css/adm.css'
	}
	
	recaptcha {
		resource url:'css/recaptcha.css'
	}
	
	info {
		dependsOn 'core'
		resource url:'css/info.css'
	}
}