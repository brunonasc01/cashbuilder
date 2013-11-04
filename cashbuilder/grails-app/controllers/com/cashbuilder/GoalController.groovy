package com.cashbuilder

class GoalController {

	def generalService
	def goalService

	static allowedMethods = [save: "POST", delete: "POST"]
	
    def index() {
		def user = session.user.attach()
		boolean consult_mode = session.consult_year? true : false

		def goalsList = goalService.getGoals(user)
		def goalStatus = goalService.getGoalStats(user)

		[goal : true, consult_mode: consult_mode, goals: goalsList, goalStatus: goalStatus ]
	}
	
	def create_modal() {
		def user = session.user.attach()
		def categoriesList = generalService.getCategoriesList(user)

		render(view: "create_modal", model: [categoriesList: categoriesList])
	}
	
	def create() {
		def user = session.user.attach()
		def categoriesList = generalService.getCategoriesList(user)

		[goal : true, categoriesList: categoriesList ]
	}
	
	def save() {
		
		def user = session.user.attach()
		def goal = goalService.saveGoal(user, params)

		if(goal.hasErrors()){
			flash.errors = g.renderErrors(bean: goal)
			generalService.buildMessage(Constants.MSG_ERROR,"goal.data.save.error")

		} else {
			generalService.buildMessage(Constants.MSG_SUCCESS,"goal.data.save.success")
		}
		
		boolean full_scr = params.full_scr

		if(full_scr && goal.hasErrors()){
			def categoriesList = generalService.getCategoriesList(user)

			render(view: "create", model: [categoriesList: categoriesList])
		} else {
			redirect(action: "index")
		}
	}
	
	def delete() {
		def goal = goalService.deleteGoal( params)
		generalService.buildMessage(Constants.MSG_SUCCESS,"goal.data.delete.success")
		
		redirect(action: "index")
	}
	
	def reset_consult(){
		session.consult_year = null
		
		redirect(action:'index')
	}
}
