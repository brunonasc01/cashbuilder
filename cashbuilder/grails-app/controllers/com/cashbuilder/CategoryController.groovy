package com.cashbuilder

class CategoryController {

    def selectedCategory() {
		
		def id = params.id
		
		if(id){
			def category = Category.findById(params.id)
			render g.select(optionKey: 'id', from: category.subcategories, id: "subcategoriesCombo", name: "subcategory.id")
		}
	}
	
	def selectedMultipleCategories() {
		
		def id = params.id
		
		if(id){
			def category = Category.findById(params.id)
			render g.select(optionKey: 'id', from: category.subcategories, id: "subcategoriesCombo", name: "subcategories[0].id")
		}
	}
	
	def new_category() {
		
		Category category = new Category(custom: true)
		category.subcategories = []
		category.subcategories += new Subcategory()
		
		[adm: true, category: category]
	}
	
	def add_subcategory(Category category){
		category.subcategories += new Subcategory(name:"")
		render(view: "new_category",model:[category: category,adm: true])
	}
	
	def save_category(Category category){
		def user = session.user.attach()
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
			
			flash.message = "Nova categoria gravada com sucesso"
			redirect(controller: "manager")
		} else {
			render(view: "new_category",model:[category: category, adm: true])
		}
	}
}
