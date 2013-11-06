package com.cashbuilder

import java.util.Map;

import com.cashbuilder.cmd.CategoryCommand;
import com.cashbuilder.cmd.CategoryDeleteCommand;

class CategoryService {

	static transactional = true
	
    def serviceMethod() {

    }
	
	Category saveCategory(User user, CategoryCommand ccmd){

		Category category = parseCommandData(ccmd)
		category.user = user

		if(category.validate()){
			category.save(flush:true)
			
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
		}

		return category
	}
	
	Category updateCategory(Map params){
		def category = Category.get(params.id)
		
		if(category){
			category.properties = params.properties
			
			if(category.validate()){
				category.save()
			}
		}
		
		return category
	}
	
	Category deleteCustomCategory(Map params, CategoryDeleteCommand cdc, boolean deleteAll) {
		
		def oldCategory = Category.get(params.id)
		def newCategory = Category.get(cdc.newId)
		
		oldCategory.subcategories.eachWithIndex { oldSub, i ->
			def transactions = Transaction.findAllByCategoryAndSubcategory(oldCategory,oldSub)
		
			if(transactions){
				transactions.each {
					
					if(!deleteAll){					
						it.category = newCategory
						it.subcategory = Subcategory.get(cdc.newSubcategories.get(i).id)
					} else {
						it.delete()
					}
				}
			}
			
			def budgetItemList = BudgetItem.findAllByCategoryAndSubcategory(oldCategory,oldSub)

			budgetItemList.each {
				it.delete()
			}
		}
		
		oldCategory.delete(flush:true);
	}
	
	Category parseCommandData(CategoryCommand ccmd){
		Category category = new Category()
		
		category.income = ccmd.income
		category.name = ccmd.name
		category.custom = ccmd.custom
		category.subcategories = []
		
		ccmd.subcategories.each {
			category.subcategories += new Subcategory(name: it.name, category: category)
		}
		
		return category
	}
}
