package com.cashbuilder

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Map;

import com.cashbuilder.beans.goal.GoalBean;

class GoalService {

	static transactional = true
	
    def serviceMethod() {

    }
	
	Goal saveGoal(User user, Map params){
		if(user){
			def goal = new Goal(params.properties)
			goal.user = user;
		
			goal.save()
			return goal
		}
	}
	
	Goal deleteGoal(Map params){
		def goal = Goal.get(params.id)

		if(goal) {
			goal.delete()			
		}
	}
	
	def getGoals(User user){
		
		def result = []
		def goals = Goal.findAllByUser(user)
				
		goals.each { goal ->
			GoalBean bean = new GoalBean()
			def c = Transaction.createCriteria()

			Double total = c.get {
				and {
					eq('user', user)
					'in'('subcategory', goal.subcategories)
					between('date', goal.startDate, goal.endDate)
				}
				projections { sum "value" }
			}
			
			total = (total)? total : 0
			
			int month = DateUtils.currentMonth
			int year = DateUtils.currentYear
			Date firstDay = DateUtils.getFirstDay(month, year)
			Date lastDay = DateUtils.getLastDay(month, year)
			
			c = Transaction.createCriteria()
			
			Double current = c.get {
				and {
					eq('user', user)
					'in'('subcategory', goal.subcategories)
					between('date', firstDay, lastDay)
				}
				projections { sum "value" }
			}
			
			current = (current)?: 0

			Date date = new Date()
			
			if(date.after(goal.endDate)){
				if(total >= goal.total){
					bean.status = Constants.META_ATINGIDA
				}else{
					bean.status = Constants.META_PERDIDA
				}
			}else{
				if(total >= goal.total){
					bean.status = Constants.META_ATINGIDA
				}else{
					bean.status = Constants.META_CORRENTE
				}
			}

			switch(bean.status){
				
				case Constants.META_CORRENTE:
				bean.percent = (total/goal.total)*100
				break
				
				case Constants.META_ATINGIDA:
				bean.percent = 100
				break
				
				case Constants.META_PERDIDA:
				bean.percent = 0
				break
			}

			Calendar cal = Calendar.getInstance()
			cal.setTime(goal.endDate)
			DateFormat cf = new SimpleDateFormat("dd / MMM")
			
			bean.id = goal.id
			bean.title = goal.title
			bean.total = goal.total
			bean.accumulated = total
			bean.currentAccumulated = current
			bean.endDate = cf.format(goal.endDate)
			bean.endYear = cal.get(Calendar.YEAR)

			result += bean
		}
		
		result
	}
	
	def getGoalStats(User user){
		
		def result = ["0","0","0"]
		def goals = Goal.findAllByUser(user)
		
		int goalsTotal = goals.size
		int finishedGoals = 0;
		int workingGoals = 0;
		int lostGoals = 0;

		goals.each { goal ->

			GoalBean bean = new GoalBean()
			def c = Transaction.createCriteria()

			Double total = c.get {
				and {
					eq('user', user)
					'in'('subcategory', goal.subcategories)
					between('date', goal.startDate, goal.endDate)
				}
				projections { sum "value" }
			}
				
			total = (total)? total : 0

			Date date = new Date()

			if(date.after(goal.endDate)){
				if(total >= goal.total){
					finishedGoals += 1
				}else{
					lostGoals += 1
				}
			}else{
				if(total >= goal.total){
					finishedGoals += 1
				}else{
					workingGoals += 1
				}
			}
		}

		if(goalsTotal > 0){
			DecimalFormat df = new DecimalFormat()
			df.setMaximumFractionDigits(2);
			
			result[0] = "${workingGoals} (${df.format((workingGoals/goalsTotal)*100)}%)"
			result[1] = "${finishedGoals} (${df.format((finishedGoals/goalsTotal)*100)}%)"
			result[2] = "${lostGoals} (${df.format((lostGoals/goalsTotal)*100)}%)"
		}
		
		result
	}
}
