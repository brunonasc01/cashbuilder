package com.cashbuilder

import com.cashbuilder.cmd.CategoryDeleteCommand;

class CategoryController {
	
	def generalService

	def categoryService

	static allowedMethods = [save_category: "POST"]
	
    def selectedCategory() {
		
		def id = params.id
		
		if(id){
			def category = Category.findById(params.id)
			render g.select(optionKey: 'id', from: category.subcategories, name: "subcategory.id")
		}
	}
	
	def selectedMultipleCategories() {
		
		def id = params.id
		def name = params.name
		
		if(id){
			def category = Category.findById(params.id)
			render g.select(optionKey: 'id', from: category.subcategories, name: name)
		}
	}
	
	def new_category() {
		def user = session.user.attach()
		def customCategories = Category.findAllByUserAndCustom(user,true);
		
		Category category = new Category(custom: true)
		category.subcategories = []
		category.subcategories += new Subcategory()
		
		[adm: true, category: category, editCategories: customCategories]
	}
	
	def add_subcategory(Category category){
		def user = session.user.attach()
		def customCategories = Category.findAllByUserAndCustom(user,true);
		
		category.user = user
		category.subcategories += new Subcategory(name:"")
		render(view: "new_category",model:[category: category, editCategories: customCategories, adm: true])
	}
	
	def remove_subcategory(Category category){
		def user = session.user.attach()
		def customCategories = Category.findAllByUserAndCustom(user,true);
		
		def subcategoriesToRemove = []

		category.subcategories.eachWithIndex { obj, i ->
			def checks = params."remove_${i}"

			if(checks){
				subcategoriesToRemove += obj
			}
		}
		category.subcategories.removeAll(subcategoriesToRemove)
		category.user = user
		
		render(view: "new_category",model:[category: category, editCategories: customCategories, adm: true])
	}
	
	def save_category(Category category){
		def user = session.user.attach()
		
		Category nCategory = categoryService.saveCategory(user, category)
			
		if(nCategory.hasErrors()){
			def customCategories = Category.findAllByUserAndCustom(user,true);
			
			generalService.buildMessage(Constants.MSG_ERROR,"manager.category.save.error")
			render(view: "new_category",model:[category: category, editCategories: customCategories, adm: true])
			
		} else {
			generalService.buildMessage(Constants.MSG_SUCCESS,"manager.category.save.success")
			redirect(action: "new_category")
		}
	}
	
	def edit_modal(){
		def category = Category.get(params.id)
			
		render(view: "edit_modal",model:[category:category])
			}

	def edit(){
		def category = Category.get(params.id)

		[adm: true, category: category]
				}
	
	def update(){
		def category = Category.get(params.id)
		
		category.properties = params.properties
		
		if(!category.validate()){
			flash.errors = g.renderErrors(bean: category)
			generalService.buildMessage(Constants.MSG_ERROR,"manager.category.update.error.message")
		} else {
			generalService.buildMessage(Constants.MSG_SUCCESS,"manager.category.update.success.message")
			}

		boolean full_scr = params.full_scr
		
		if(full_scr && !category.validate()){
			render(view: "edit", model:[adm: true, category:category])
		} else {
			redirect(action: "new_category")
		}
	}
	
	def delete_modal(){
		def category = Category.get(params.id)

		def user = session.user.attach()
		def categoriesList = generalService.getCategoriesList(user)
		
		render(view: "delete_modal",model:[oldCategory:category, categoriesList: categoriesList])
	}
	
	def update_deletion(CategoryDeleteCommand cdc){
		def oldCategory = Category.get(params.id)
		def newCategory = Category.get(cdc.newId)
		
		oldCategory.subcategories.eachWithIndex { oldSub, i ->
			def transactions = Transaction.findAllByCategoryAndSubcategory(oldCategory,oldSub)
		
			if(transactions){
				transactions.each {
					it.category = newCategory
					it.subcategory = Subcategory.get(cdc.newSubcategories.get(i).id)
				}
			}
			
			def budgetItemList = BudgetItem.findAllByCategoryAndSubcategory(oldCategory,oldSub)

			budgetItemList.each {
				it.delete()
			}
		}
		
		oldCategory.delete();

		redirect(controller:"admin")
	}
}
