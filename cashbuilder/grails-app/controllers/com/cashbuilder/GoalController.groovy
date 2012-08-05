package com.cashbuilder

class GoalController {

	def generalService
	def goalService

	static allowedMethods = [save: "POST", delete: "POST"]
	
    def index() {
		def user = session.user.attach()

		def goalsList = goalService.getGoals(user)
		def goalStatus = goalService.getGoalStats(user)

		[goal : true, goals: goalsList, goalStatus: goalStatus ]
	}
	
	def newGoal() {
		def user = session.user.attach()
		def categoriesList = generalService.getCategoriesList(user)

		render(view: "newgoal", model: [categoriesList: categoriesList])
	}
	
	def save() {
		
		def user = session.user.attach()
		def goal = goalService.saveGoal(user, params)

		if(goal.hasErrors()){
			flash.message = g.renderErrors(bean: goal)
		}

		redirect(action: "index")
	}
	
	def delete() {
		def goal = goalService.deleteGoal( params)
		
		redirect(action: "index")
	}
}
