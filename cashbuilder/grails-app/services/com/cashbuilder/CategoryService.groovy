package com.cashbuilder

import java.util.Map;

class CategoryService {

	static transactional = true
	
    def serviceMethod() {

    }
	
	Category saveCategory(User user, Category category){
		if(user){
			category.user = user
			
			if(category.save()){
				
				def budgets = Budget.findAllByUser(user)
				def c = BudgetMonth.createCriteria()
				
				def budgetMonths = c.list{
					'in'('budget', budgets)
				}
	
				budgetMonths.each { budgetMonth ->
					def subcategories = Subcategory.findAllByCategory(category)
	
					subcategories.each{ subcategory ->
						new BudgetItem(category:category,subcategory:subcategory,month:budgetMonth).save()
					}
				}
			} else {
				category.subcategories.each {
					it.validate()
				}
			}
		}
		
		return category
	}
}
