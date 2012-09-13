package com.cashbuilder

import java.util.Map;

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
						String category = baseLine[0]
						boolean income = ("Receitas").equals(category)
						
						double variationFactor = baseLine[2] as double
						Category categoryBean = new Category( name:category, user:user, income:income, variationFactor:variationFactor )
						
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
}

