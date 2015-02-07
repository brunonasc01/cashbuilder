package com.cashbuilder

import java.util.Map;

import com.cashbuilder.cmd.UserRegisterCommand;

class UserService {

	static transactional = true
	
    def serviceMethod() {

    }
	
	/**
	 * 
	 * @param email
	 * @return
	 */
	boolean isEmailAvailable(String email){		
		return (User.findByEmail(email) == null)
	}
	
	/**
	 * 
	 * @param params
	 * @return
	 */
	User verifyLogin(Map params){
		String password = Encoder.encode(params.password)
		return User.findByEmailAndPassword(params.email,password)
	}
	
	User saveUser(UserRegisterCommand urc){
		User user = null

		if(urc.validate() && isEmailAvailable(urc.email)){
			user = parseCommandData(urc)
			user.password = Encoder.encode(user.password)
			user.save(flush: true)
		}

		return user
	}
	
	/**
	 * 
	 * @param user
	 * @param files
	 * @return
	 */
	boolean buildProfile(User user, def files){
	
		Budget budget = new Budget(year: DateUtils.currentYear,user:user)
		
		if(budget.save()){
			files.each { file ->
				file.eachLine{ line ->					
					String[] baseLine = line.split(":")
					
					if(baseLine.length > 0 && !baseLine[0].contains("#")){
						String[] categoryAndFactor = baseLine[0].split(";")

						String categoryName = categoryAndFactor[0]
						double variationFactor = categoryAndFactor[1] as double
						boolean income = ("receitas").equals(categoryName)

						Category categoryBean = new Category( name:categoryName, user:user, income:income, variationFactor:variationFactor )
						
						if(categoryBean.save()){
							String[] subcategories = baseLine[1].split(";")
							
							subcategories.each { name ->
								new Subcategory(name: name,category:categoryBean).save()
							}
						}
					}
				}
			}
	   
			def categories = Category.findAllByUser(user)
	   
			(0..11).each { month ->
				BudgetMonth budgetMonth = new BudgetMonth(month:month,budget:budget)
				
				if(budgetMonth.save()){
					categories.each{ category ->
						def subcategories = Subcategory.findAllByCategory(category)
						
						subcategories.each{ subcategory ->
							new BudgetItem(category:category,subcategory:subcategory,month:budgetMonth).save()
						}
					}
				}
			}
		}
	}
	
	User parseCommandData(UserRegisterCommand urc){
		User user = new User(urc.properties)
		user.profile = new Profile()

		user.profile.state = urc.state
		user.profile.city = urc.city

		return user
	}
}

